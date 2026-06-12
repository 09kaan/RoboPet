import 'package:cloud_functions/cloud_functions.dart';
import '../models/game_item.dart';
import '../models/robot_instance.dart';
 
class GachaResult {
  GachaResult({
    required this.instanceId,
    required this.defId,
    required this.rarity,
    required this.slot,
    required this.forcedEpic,
    required this.pity,
  });
  final String instanceId;
  final String defId;
  final Rarity rarity;
  final ModuleSlot slot;
  final bool forcedEpic;
  final int pity;
}
 
class GachaException implements Exception {
  GachaException(this.code, this.message);
  final String code;
  final String message;
  @override
  String toString() => 'GachaException($code): $message';
}
 
class GachaService {
  GachaService(this._functions);
  final FirebaseFunctions _functions;
 
  /// Calls rollGacha. Throws GachaException('insufficient'...) on low balance.
  Future<GachaResult> roll() async {
    try {
      final callable = _functions.httpsCallable('rollGacha');
      final res = await callable.call<Map<String, dynamic>>();
      final d = res.data;
      return GachaResult(
        instanceId: d['instanceId'] as String,
        defId: d['defId'] as String,
        rarity: Rarity.values
            .firstWhere((e) => e.name == d['rarity'] as String),
        slot: ModuleSlot.values
            .firstWhere((e) => e.name == d['slot'] as String),
        forcedEpic: d['forcedEpic'] as bool? ?? false,
        pity: (d['pity'] as num?)?.toInt() ?? 0,
      );
    } on FirebaseFunctionsException catch (e) {
      // 'failed-precondition' => insufficient currency, etc.
      throw GachaException(e.code, e.message ?? 'Gacha roll failed.');
    }
  }
}
