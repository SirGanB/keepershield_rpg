import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/models/ability_model.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  CharacterModel _character;
  CharactersRepository _repository;
  int level = 0;
  int proficiencyBonus = 0;

  CharacterViewModel({
    required CharacterModel character,
    required CharactersRepository repository,
  })  : _character = character,
        _repository = repository {
    _setLevel();
    _setProficiencyBonus();
  }

  String get name => _character.name;
  int get currentHealth => _character.currentHealth;
  int get maxHealth => _character.maxHealth;
  AbilityScoresCollection get atributes => _character.abilityScores;

  _setLevel() {
    _character.classes.forEach((map) {
      map.forEach((key, value) {
        level += value;
      });
    });
  }

  _setProficiencyBonus() => proficiencyBonus = 2 + ((level - 1) ~/ 4);

  int defineProficiencyValue({
    required int modifier,
    required ProficiencyType proficiency,
  }) {
    if (proficiency == ProficiencyType.normal)
      return modifier;
    else if (proficiency == ProficiencyType.proficient)
      return modifier + proficiencyBonus;
    else
      return modifier + (proficiencyBonus * 2);
  }

  int defineArmorClass() => atributes.dexterity.modifier + 10;

  int definePassivePerception() {
    int value = defineProficiencyValue(
      modifier: atributes.wisdom.modifier,
      proficiency: atributes.wisdom.perception,
    );

    return value + 10;
  }

  void updateSavingThrow({
    required AbilityModel ability,
    required ProficiencyType proficiency,
  }) {
    switch (ability.runtimeType) {
      case Strength:
        _character.abilityScores.strength.proficiency = proficiency;
        break;
      case Dexterity:
        _character.abilityScores.dexterity.proficiency = proficiency;
        break;
      case Constitution:
        _character.abilityScores.constitution.proficiency = proficiency;
        break;
      case Intelligence:
        _character.abilityScores.intelligence.proficiency = proficiency;
        break;
      case Wisdom:
        _character.abilityScores.wisdom.proficiency = proficiency;
        break;
      case Charisma:
        _character.abilityScores.charisma.proficiency = proficiency;
        break;
    }

    _repository.create(character: _character);

    notifyListeners();
  }
}
