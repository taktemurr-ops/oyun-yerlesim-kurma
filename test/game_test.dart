import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yerlesim_kurma/oyun_yerlesim_kurma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yerlesimConfig.title.length, 33);
    expect(yerlesimConfig.tagline.length, 33);
    for (final s in yerlesimConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: yerlesimId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = yerlesimRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
