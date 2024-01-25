import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/models/ability_model.dart';
import 'package:keepershield_rpg/models/skill_model.dart';
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
  AbilityScoresCollection get abilityScores => _character.abilityScores;

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

  int defineArmorClass() => abilityScores.dexterity.modifier + 10;

  int definePassivePerception() {
    int value = defineProficiencyValue(
      modifier: abilityScores.wisdom.modifier,
      proficiency: abilityScores.wisdom.perception.proficiency,
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

  void updateAbilityScore({
    required AbilityModel ability,
    required int value,
  }) {
    switch (ability.runtimeType) {
      case Strength:
        _character.abilityScores.strength.value = value;
        break;
      case Dexterity:
        _character.abilityScores.dexterity.value = value;
        break;
      case Constitution:
        _character.abilityScores.constitution.value = value;
        break;
      case Intelligence:
        _character.abilityScores.intelligence.value = value;
        break;
      case Wisdom:
        _character.abilityScores.wisdom.value = value;
        break;
      case Charisma:
        _character.abilityScores.charisma.value = value;
        break;
    }

    _repository.create(character: _character);

    notifyListeners();
  }

  void updateSkill({
    required SkillModel skill,
    required ProficiencyType proficiency,
  }) {
    switch (skill.runtimeType) {
      case Athletics:
        _character.abilityScores.strength.athletics.proficiency = proficiency;
        break;
      case Acrobatics:
        _character.abilityScores.dexterity.acrobatics.proficiency = proficiency;
        break;
      case Stealth:
        _character.abilityScores.dexterity.stealth.proficiency = proficiency;
        break;
      case SleightOfHand:
        _character.abilityScores.dexterity.sleightOfHand.proficiency =
            proficiency;
        break;
      case Arcana:
        _character.abilityScores.intelligence.arcana.proficiency = proficiency;
        break;
      case History:
        _character.abilityScores.intelligence.history.proficiency = proficiency;
        break;
      case Investigation:
        _character.abilityScores.intelligence.investigation.proficiency =
            proficiency;
        break;
      case Nature:
        _character.abilityScores.intelligence.nature.proficiency = proficiency;
        break;
      case Religion:
        _character.abilityScores.intelligence.religion.proficiency =
            proficiency;
        break;
      case Insight:
        _character.abilityScores.wisdom.insight.proficiency = proficiency;
        break;
      case AnimalHandling:
        _character.abilityScores.wisdom.animalHandling.proficiency =
            proficiency;
        break;
      case Medicine:
        _character.abilityScores.wisdom.medicine.proficiency = proficiency;
        break;
      case Perception:
        _character.abilityScores.wisdom.perception.proficiency = proficiency;
        break;
      case Survival:
        _character.abilityScores.wisdom.survival.proficiency = proficiency;
        break;
      case Performance:
        _character.abilityScores.charisma.performance.proficiency = proficiency;
        break;
      case Deception:
        _character.abilityScores.charisma.deception.proficiency = proficiency;
        break;
      case Intimidation:
        _character.abilityScores.charisma.intimidation.proficiency =
            proficiency;
        break;
      case Persuasion:
        _character.abilityScores.charisma.persuasion.proficiency = proficiency;
        break;
    }

    _repository.create(character: _character);
    notifyListeners();
  }
}
