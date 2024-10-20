import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharacterModel _char;

  int level = 0;
  int proficiencyBonus = 0;

  CharacterViewModel({
    required CharacterModel char,
  }) : _char = char {
    _setLevel();
    _setProficiencyBonus();
  }

  String get name => _char.name;
  int get currentHealth => _char.currentHealth;
  int get maxHealth => _char.maxHealth;
  int get strength => _char.strength;
  int get dexterity => _char.dexterity;
  int get constitution => _char.constitution;
  int get intelligence => _char.intelligence;
  int get wisdom => _char.wisdom;
  int get charisma => _char.charisma;
  int get initiative => getModifier(atribute: _char.dexterity);

  // Metodo para definir o nível do personagem
  void _setLevel() {
    level = _char.classes.fold(0, (sum, classe) => sum + classe.level);
  }

  int getModifier({required int atribute}) => (atribute - 10) ~/ 2;

  // Metodo para definir o bônus de proficiência
  void _setProficiencyBonus() => proficiencyBonus = 2 + ((level - 1) ~/ 4);

  // Metodo para definir o valor de proficiência
  int defineProficiencyValue({
    required int modifier,
    required ProficiencyType proficiency,
  }) {
    if (proficiency == ProficiencyType.nonProficient) {
      return modifier;
    } else if (proficiency == ProficiencyType.proficient)
      {return modifier + proficiencyBonus;}
    else
      {return modifier + (proficiencyBonus * 2);}
  }

  // Metodo para definir a classe de armadura
  int defineArmorClass() => _char.dexterity + 10;

  // Metodo para definir a percepção passiva
  int definePassivePerception() {
    int value = defineProficiencyValue(
      modifier: _char.wisdom,
      proficiency: ProficiencyType.proficient,
    );

    return value + 10;
  }
}