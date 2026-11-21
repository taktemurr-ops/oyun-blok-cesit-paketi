import 'package:flutter_test/flutter_test.dart';
import 'package:game_001_block_puzzle_master/game/block_engine.dart';
import 'package:oyun_blok_cesit_paketi/oyun_blok_cesit_paketi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('20 varyant, kimlikler benzersiz', () {
    expect(blokCesitleri.length, 20);
    final ids = blokCesitleri.map((c) => c.id).toSet();
    expect(ids.length, 20);
    for (final c in blokCesitleri) {
      if (c.box > 0) expect(c.size % c.box, 0, reason: c.key);
    }
  });

  for (final c in blokCesitleri) {
    test('${c.key}: bölümler üretilir ve doğrulanır', () {
      final rules = c.rules;
      final planner = LevelPlanner(gameId: rules.gameId, optionalMechanics: rules.optionalMechanics);
      for (final lv in [1, 25, 99, 350, 1234, 8888, 30000]) {
        final g = rules.build(planner.spec(lv));
        final l = g.puzzle;
        expect(l.size, c.size);
        expect(l.box, c.box);
        expect(g.validation.ok, isTrue, reason: '${c.key} bölüm $lv: ${g.validation.reason}');
        final game = BlockGame(l);
        expect(game.hasMove, isTrue);
        if (c.shapes.isNotEmpty) {
          for (final p in game.tray) {
            if (p != null) expect(c.shapes.contains(p.shape), isTrue);
          }
        }
      }
      for (final m in rules.modes) {
        final g = rules.build(planner.spec(40, mode: m));
        expect(g.puzzle.size, c.size);
      }
    });
  }
}
