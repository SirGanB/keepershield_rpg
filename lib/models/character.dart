import 'package:rpg_keeper_hub/models/class.dart';

class Character {
  final String _name;
  final String _race;
  final List<Class> _collClasses;
  final String _owner;
  final int _currentHP;
  final int _maxHP;
  final int _armorClass;

  Character({
    required String name,
    required String race,
    required List<Class> collClasses,
    required String owner,
    required int currentHP,
    required int maxHP,
    required int armorClass,
  })  : _name = name,
        _race = race,
        _collClasses = collClasses,
        _owner = owner,
        _currentHP = currentHP,
        _maxHP = maxHP,
        _armorClass = armorClass;

  String get name => _name;
  String get race => _race;
  String get owner => _owner;
  int get currentHP => _currentHP;
  int get maxHP => _maxHP;
  int get armorClass => _armorClass;

  String get classes => _collClasses.length == 1
      ? '${_collClasses[0].name}, level: $level'
      : 'Multiclasse, level: $level';

  int get level {
    int level = 0;
    for (var e in _collClasses) {
      level += e.level;
    }
    return level;
  }
}
