import 'dart:math';

class DiceModel {
  final int _sides;

  DiceModel({required int sides}) : _sides = sides;

  static roll({required int sides}) {
    return Random().nextInt(sides) + 1;
  }

  @override
  String toString() {
    return 'd$_sides';
  }
}

enum DiceSides { d2, d4, d6, d10, d12, d20, d100 }
