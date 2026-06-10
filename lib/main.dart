import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'app/app_lifecycle_reactor.dart';
import 'app/providers.dart';
import 'data/isar_service.dart';
import 'ui/game_screen.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1) Firebase first.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  // 2) Open Isar (Phase 1).
  final isar = await IsarService.instance();
 
  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const RoboPetApp(),
    ),
  );
}

class RoboPetApp extends StatelessWidget {
  const RoboPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoboPet',
      debugShowCheckedModeBanner: false,
      theme: buildCyberpunkTheme(),
      // The reactor wraps the screen so lifecycle events are observed app-wide.
      home: const AppLifecycleReactor(child: GameScreen()),
    );
  }
}
