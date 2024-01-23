import 'package:keepershield_rpg/models/_lib_model.dart';

abstract class AbilityModel {
  int value;
  ProficiencyType proficiency;

  AbilityModel({
    required this.value,
    required this.proficiency,
  });

  int get modifier => (value - 10) ~/ 2;
}

class Strength extends AbilityModel {
  ProficiencyType athletics;

  Strength({
    int? value,
    ProficiencyType? proficiency,
    this.athletics = ProficiencyType.normal,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}

class Dexterity extends AbilityModel {
  ProficiencyType acrobatics;
  ProficiencyType sleightOfHands;
  ProficiencyType stealth;

  Dexterity({
    int? value,
    ProficiencyType? proficiency,
    this.acrobatics = ProficiencyType.normal,
    this.sleightOfHands = ProficiencyType.normal,
    this.stealth = ProficiencyType.normal,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}

class Constitution extends AbilityModel {
  Constitution({
    int? value,
    ProficiencyType? proficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}

class Intelligence extends AbilityModel {
  ProficiencyType arcana;
  ProficiencyType history;
  ProficiencyType investigation;
  ProficiencyType nature;
  ProficiencyType religion;

  Intelligence({
    int? value,
    ProficiencyType? proficiency,
    this.arcana = ProficiencyType.normal,
    this.history = ProficiencyType.normal,
    this.investigation = ProficiencyType.normal,
    this.nature = ProficiencyType.normal,
    this.religion = ProficiencyType.normal,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}

class Wisdom extends AbilityModel {
  ProficiencyType animalHandling;
  ProficiencyType insight;
  ProficiencyType medicine;
  ProficiencyType perception;
  ProficiencyType survival;

  Wisdom({
    int? value,
    ProficiencyType? proficiency,
    this.animalHandling = ProficiencyType.normal,
    this.insight = ProficiencyType.normal,
    this.medicine = ProficiencyType.normal,
    this.perception = ProficiencyType.normal,
    this.survival = ProficiencyType.normal,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}

class Charisma extends AbilityModel {
  ProficiencyType deception;
  ProficiencyType intimidation;
  ProficiencyType performance;
  ProficiencyType persuasion;

  Charisma({
    int? value,
    ProficiencyType? proficiency,
    this.deception = ProficiencyType.normal,
    this.intimidation = ProficiencyType.normal,
    this.performance = ProficiencyType.normal,
    this.persuasion = ProficiencyType.normal,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        );
}
