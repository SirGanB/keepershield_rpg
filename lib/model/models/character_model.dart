import 'package:keepershield_rpg/model/lib_model.dart';

class CharacterModel {
  final String _name;
  final String _race;
  final List<ClassModel> _classes;
  final int _currentHP;
  final int _maxHP;
  final int _armorClass;

  CharacterModel({
    required String name,
    required String race,
    required List<ClassModel> classes,
    required String owner,
    required int currentHP,
    required int maxHP,
    required int armorClass,
  })  : _name = name,
        _race = race,
        _classes = classes,
        _currentHP = currentHP,
        _maxHP = maxHP,
        _armorClass = armorClass;

  String get name => _name;
  String get race => _race;
  int get currentHP => _currentHP;
  int get maxHP => _maxHP;
  int get armorClass => _armorClass;

  String get classes => _classes.length == 1
      ? '${_classes[0].name}, level: $level'
      : 'Multiclasse, level: $level';

  int get level {
    int level = 0;
    for (var classe in _classes) {
      level += classe.level;
    }
    return level;
  }
}
