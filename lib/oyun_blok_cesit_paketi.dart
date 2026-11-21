/// Blok Çeşit Paketi: Blok Bulmaca motoruyla 20 varyant.
///
/// Her varyantın kendi kimliği, kaydı ve 50.000 bölümü vardır. Merkez
/// uygulamada tek kutucuk altında listelenir ([blokCesitGroup]).
library;

import 'package:flutter/material.dart';
import 'package:game_001_block_puzzle_master/game/block_view.dart';
import 'package:game_001_block_puzzle_master/game/rules.dart';
import 'package:studio_core/app/game_api.dart';
import 'package:studio_core/app/hub.dart';

class BlokCesit {
  final String key;
  final List<String> title;
  final List<String> tagline;
  final int size;
  final int box;
  final List<int> shapes;
  final List<String> forced;
  final Color color;
  final IconData icon;
  const BlokCesit(this.key, this.title, this.tagline, this.size, this.box, this.shapes, this.forced, this.color, this.icon);

  String get id => 'oyun-blok-cesit-$key';

  BlockRules get rules => BlockRules(
        id: id,
        boardSize: size,
        boxSize: box,
        shapes: shapes,
        forced: forced,
      );
}

const blokCesitleri = <BlokCesit>[
  BlokCesit('mini-6', ['Mini 6x6', 'Mini 6x6', 'Mini 6x6', 'Mini 6x6', 'Mini 6x6'], ['Küçük tahta, hızlı eller', 'Small board, quick hands', 'Small board, quick hands', 'Small board, quick hands', 'Small board, quick hands'], 6, 0, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12], const [], Color(0xFFEF5350), Icons.crop_square_rounded),
  BlokCesit('yedili', ['Yedili Tahta', 'Seven Board', 'Siebener-Brett', 'Tablero de Siete', 'Plateau Sept'], ['7x7 tahtada denge oyunu', 'A balancing act on 7x7', 'A balancing act on 7x7', 'A balancing act on 7x7', 'A balancing act on 7x7'], 7, 0, [], const [], Color(0xFFAB47BC), Icons.grid_4x4_rounded),
  BlokCesit('genis-9', ['Geniş 9x9', 'Wide 9x9', 'Weites 9x9', 'Amplio 9x9', 'Large 9x9'], ['Kutusuz, ferah 9x9', 'Roomy 9x9, no boxes', 'Roomy 9x9, no boxes', 'Roomy 9x9, no boxes', 'Roomy 9x9, no boxes'], 9, 0, [], const [], Color(0xFF5C6BC0), Icons.grid_on_rounded),
  BlokCesit('buyuk-10', ['Büyük 10x10', 'Big 10x10', 'Groß 10x10', 'Grande 10x10', 'Grand 10x10'], ['Daha çok yer, daha büyük kombolar', 'More room, bigger combos', 'More room, bigger combos', 'More room, bigger combos', 'More room, bigger combos'], 10, 0, [], const [], Color(0xFF42A5F5), Icons.apps_rounded),
  BlokCesit('dev-12', ['Dev 12x12', 'Giant 12x12', 'Riesig 12x12', 'Gigante 12x12', 'Géant 12x12'], ['Uzun soluklu dev tahta', 'A long-haul giant board', 'A long-haul giant board', 'A long-haul giant board', 'A long-haul giant board'], 12, 0, [], const [], Color(0xFF26A69A), Icons.view_module_rounded),
  BlokCesit('cizgiler', ['Çizgiler', 'Lines Only', 'Nur Linien', 'Solo Líneas', 'Que des Lignes'], ['Yalnız düz parçalar', 'Straight pieces only', 'Straight pieces only', 'Straight pieces only', 'Straight pieces only'], 8, 0, [0, 1, 2, 3, 4, 10, 11, 17, 18], const [], Color(0xFF66BB6A), Icons.drag_handle_rounded),
  BlokCesit('koseler', ['Köşeler', 'Corners', 'Ecken', 'Esquinas', 'Coins'], ['L ve köşe parçaları', 'L and corner pieces', 'L and corner pieces', 'L and corner pieces', 'L and corner pieces'], 8, 0, [0, 5, 6, 7, 8, 13, 14, 19], const [], Color(0xFF9CCC65), Icons.turn_right_rounded),
  BlokCesit('kareler', ['Kareler', 'Squares', 'Quadrate', 'Cuadrados', 'Carrés'], ['Kare parçalarla 9x9', 'Square pieces on 9x9', 'Square pieces on 9x9', 'Square pieces on 9x9', 'Square pieces on 9x9'], 9, 0, [0, 1, 2, 9, 20], const [], Color(0xFFD4E157), Icons.square_rounded),
  BlokCesit('dortlu', ['Dörtlüler', 'Fours', 'Vierer', 'Cuatros', 'Quatre'], ['Dört kareli parçalar, 10x10', 'Four-cell pieces on 10x10', 'Four-cell pieces on 10x10', 'Four-cell pieces on 10x10', 'Four-cell pieces on 10x10'], 10, 0, [9, 10, 11, 12, 13, 14, 15, 16], const [], Color(0xFFFFCA28), Icons.extension_rounded),
  BlokCesit('besli', ['Uzun Parçalar', 'Long Pieces', 'Lange Teile', 'Piezas Largas', 'Pièces Longues'], ['Beşlik çizgiler ve büyük L', 'Five-long lines and big Ls', 'Five-long lines and big Ls', 'Five-long lines and big Ls', 'Five-long lines and big Ls'], 10, 0, [0, 1, 2, 3, 4, 17, 18, 19, 20], const [], Color(0xFFFFA726), Icons.straighten_rounded),
  BlokCesit('kolay', ['Kolay Parçalar', 'Easy Pieces', 'Leichte Teile', 'Piezas Fáciles', 'Pièces Faciles'], ['En fazla üç kare, rahat oyun', 'Up to three cells, relaxed', 'Up to three cells, relaxed', 'Up to three cells, relaxed', 'Up to three cells, relaxed'], 8, 0, [0, 1, 2, 3, 4, 5, 6, 7, 8], const [], Color(0xFF8D6E63), Icons.spa_rounded),
  BlokCesit('iri', ['İri Parçalar', 'Chunky Pieces', 'Dicke Teile', 'Piezas Grandes', 'Grosses Pièces'], ['Sadece büyük parçalar, 10x10', 'Only big pieces, 10x10', 'Only big pieces, 10x10', 'Only big pieces, 10x10', 'Only big pieces, 10x10'], 10, 0, [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], const [], Color(0xFF78909C), Icons.widgets_rounded),
  BlokCesit('dort-kutu', ['Dört Kutu', 'Four Boxes', 'Vier Felder', 'Cuatro Cajas', 'Quatre Cases'], ['8x8, 4x4 kutular da silinir', '8x8, 4x4 boxes clear too', '8x8, 4x4 boxes clear too', '8x8, 4x4 boxes clear too', '8x8, 4x4 boxes clear too'], 8, 4, [], const [], Color(0xFFEC407A), Icons.window_rounded),
  BlokCesit('ikili-kutu', ['İkili Kutular', 'Twin Boxes', 'Zweier-Felder', 'Cajas Dobles', 'Cases Doubles'], ['6x6, 2x2 kutular silinir', '6x6, 2x2 boxes clear', '6x6, 2x2 boxes clear', '6x6, 2x2 boxes clear', '6x6, 2x2 boxes clear'], 6, 2, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], const [], Color(0xFFF06292), Icons.dashboard_rounded),
  BlokCesit('dev-kutu', ['Dev Kutular', 'Giant Boxes', 'Riesenfelder', 'Cajas Gigantes', 'Cases Géantes'], ['12x12, 4x4 kutular', '12x12 with 4x4 boxes', '12x12 with 4x4 boxes', '12x12 with 4x4 boxes', '12x12 with 4x4 boxes'], 12, 4, [], const [], Color(0xFF7E57C2), Icons.view_quilt_rounded),
  BlokCesit('besli-kutu', ['Beşli Kutular', 'Five Boxes', 'Fünfer-Felder', 'Cajas de Cinco', 'Cases de Cinq'], ['10x10, 5x5 kutular', '10x10 with 5x5 boxes', '10x10 with 5x5 boxes', '10x10 with 5x5 boxes', '10x10 with 5x5 boxes'], 10, 5, [], const [], Color(0xFF29B6F6), Icons.grid_view_rounded),
  BlokCesit('kolay-sudoku', ['Kolay Sudoku', 'Easy Sudoku', 'Leichtes Sudoku', 'Sudoku Fácil', 'Sudoku Facile'], ['9x9 kutulu, küçük parçalar', '9x9 boxes, small pieces', '9x9 boxes, small pieces', '9x9 boxes, small pieces', '9x9 boxes, small pieces'], 9, 3, [0, 1, 2, 3, 4, 5, 6, 7, 8], const [], Color(0xFF26C6DA), Icons.grid_3x3_rounded),
  BlokCesit('tasli', ['Taşlı Tahta', 'Stone Board', 'Steinbrett', 'Tablero de Piedra', 'Plateau de Pierre'], ['Taşların arasından yol bul', 'Work around the stones', 'Work around the stones', 'Work around the stones', 'Work around the stones'], 7, 0, [], ['obstacle'], Color(0xFF6D4C41), Icons.landscape_rounded),
  BlokCesit('buzlu', ['Buzlu Tahta', 'Ice Board', 'Eisbrett', 'Tablero de Hielo', 'Plateau Glacé'], ['Buzu iki kez kırarak temizle', 'Crack the ice twice', 'Crack the ice twice', 'Crack the ice twice', 'Crack the ice twice'], 8, 0, [], ['ice'], Color(0xFF4FC3F7), Icons.ac_unit_rounded),
  BlokCesit('elmas', ['Elmas Avı', 'Gem Hunt', 'Edelsteinjagd', 'Caza de Gemas', 'Chasse aux Gemmes'], ['Elmaslı sıraları temizle', 'Clear the gem lines', 'Clear the gem lines', 'Clear the gem lines', 'Clear the gem lines'], 8, 0, [], ['gem'], Color(0xFF00BFA5), Icons.diamond_rounded),
];

const _howTo = [
  TutorialStep(Icons.pan_tool_alt, [
    'Parçaları tahtaya sürükle ya da parçaya, sonra kareye dokun.',
    'Drag pieces onto the board, or tap a piece then a cell.',
    'Ziehe Teile aufs Brett oder tippe Teil und Feld an.',
    'Arrastra piezas al tablero o toca pieza y casilla.',
    'Glissez les pièces ou touchez une pièce puis une case.',
  ]),
  TutorialStep(Icons.auto_awesome, [
    'Dolan satır ve sütunlar (kutulu varyantta kutular da) silinir.',
    'Full rows and columns clear (and boxes in box variants).',
    'Volle Reihen und Spalten (und Felder) verschwinden.',
    'Filas y columnas llenas (y cajas) desaparecen.',
    'Lignes, colonnes (et cases) pleines disparaissent.',
  ]),
];

GameConfig configOf(BlokCesit c) => GameConfig(
      gameId: c.id,
      title: c.title,
      tagline: c.tagline,
      seedColor: c.color,
      icon: c.icon,
      rules: c.rules,
      buildPlay: (ctx) => BlockView(ctx: ctx),
      tutorial: _howTo,
    );

final blokCesitConfigs = [for (final c in blokCesitleri) configOf(c)];

final blokCesitGroup = HubGroup(
  id: 'oyun-blok-cesit-paketi',
  title: const ['Blok Çeşitleri', 'Block Variety', 'Block-Vielfalt', 'Variedad de Bloques', 'Variété de Blocs'],
  tagline: const ['tahta ve parça çeşidi', 'boards and piece sets', 'Bretter und Teile', 'tableros y piezas', 'plateaux et pièces'],
  seedColor: const Color(0xFFFF7043),
  icon: Icons.dashboard_customize_rounded,
  games: blokCesitConfigs,
);
