import 'package:cloud_functions/cloud_functions.dart';
import '../models/module_enums.dart';
 
class GachaResult {
  GachaResult({
    required this.instanceId,
    required this.defId,
    required this.rarity,
    required this.forcedEpic,
    required this.pity,
  });
  final String instanceId;
  final String defId;
  final ModuleRarity rarity;
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
        rarity: ModuleRarity.values
            .firstWhere((e) => e.name == d['rarity'] as String),
        forcedEpic: d['forcedEpic'] as bool? ?? false,
        pity: (d['pity'] as num?)?.toInt() ?? 0,
      );
    } on FirebaseFunctionsException catch (e) {
      // 'failed-precondition' => insufficient currency, etc.
      throw GachaException(e.code, e.message ?? 'Gacha roll failed.');
    }
  }
}
