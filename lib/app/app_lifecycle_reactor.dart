import 'dart:async';
 
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
import 'providers.dart';
 
class AppLifecycleReactor extends ConsumerStatefulWidget {
  const AppLifecycleReactor({super.key, required this.child});
  final Widget child;
 
  @override
  ConsumerState<AppLifecycleReactor> createState() =>
      _AppLifecycleReactorState();
}
 
class _AppLifecycleReactorState extends ConsumerState<AppLifecycleReactor>
    with WidgetsBindingObserver {
  Timer? _ticker;
 
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTicker();
  }
 
  @override
  void dispose() {
    _ticker?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
 
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _reconcile();   // offline catch-up for the time we were away
        _startTicker(); // resume foreground smoothing
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        _ticker?.cancel();
    }
  }
 
  /// Foreground smoothing: advance + persist a few times a minute so the bars
  /// animate live. The math is identical to the offline path -- it is the same
  /// reconcile() call, just over tiny deltas. Tune the interval to taste.
  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 3), (_) => _reconcile());
  }
 
  Future<void> _reconcile() async {
    if (!mounted) return;
    await ref.read(robotRepositoryProvider).loadActiveAndReconcile();
  }
 
  @override
  Widget build(BuildContext context) => widget.child;
}
