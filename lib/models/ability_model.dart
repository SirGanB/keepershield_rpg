import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/models/skill_model.dart';

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
  late Athletics athletics;

  Strength({
    int? value,
    ProficiencyType? proficiency,
    ProficiencyType? athleticsProficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        ) {
    athletics =
        Athletics(proficiency: athleticsProficiency ?? ProficiencyType.normal);
  }
}

class Dexterity extends AbilityModel {
  late Acrobatics acrobatics;
  late SleightOfHand sleightOfHand;
  late Stealth stealth;

  Dexterity({
    int? value,
    ProficiencyType? proficiency,
    ProficiencyType? acrobaticsProficiency,
    ProficiencyType? sleightOfHandProficiency,
    ProficiencyType? stealthProficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        ) {
    acrobatics = Acrobatics(
        proficiency: acrobaticsProficiency ?? ProficiencyType.normal);
    sleightOfHand = SleightOfHand(
        proficiency: sleightOfHandProficiency ?? ProficiencyType.normal);
    stealth =
        Stealth(proficiency: stealthProficiency ?? ProficiencyType.normal);
  }
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
  late Arcana arcana;
  late History history;
  late Investigation investigation;
  late Nature nature;
  late Religion religion;

  Intelligence({
    int? value,
    ProficiencyType? proficiency,
    ProficiencyType? arcanaProficiency,
    ProficiencyType? historyProficiency,
    ProficiencyType? investigationProficiency,
    ProficiencyType? natureProficiency,
    ProficiencyType? religionProficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        ) {
    arcana = Arcana(proficiency: arcanaProficiency ?? ProficiencyType.normal);
    history =
        History(proficiency: historyProficiency ?? ProficiencyType.normal);
    investigation = Investigation(
        proficiency: investigationProficiency ?? ProficiencyType.normal);
    nature = Nature(proficiency: natureProficiency ?? ProficiencyType.normal);
    religion =
        Religion(proficiency: religionProficiency ?? ProficiencyType.normal);
  }
}

class Wisdom extends AbilityModel {
  late AnimalHandling animalHandling;
  late Insight insight;
  late Medicine medicine;
  late Perception perception;
  late Survival survival;

  Wisdom({
    int? value,
    ProficiencyType? proficiency,
    ProficiencyType? animalHandlingProficiency,
    ProficiencyType? insightProficiency,
    ProficiencyType? medicineProficiency,
    ProficiencyType? perceptionProficiency,
    ProficiencyType? survivalProficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        ) {
    animalHandling = AnimalHandling(
        proficiency: animalHandlingProficiency ?? ProficiencyType.normal);
    insight =
        Insight(proficiency: insightProficiency ?? ProficiencyType.normal);
    medicine =
        Medicine(proficiency: medicineProficiency ?? ProficiencyType.normal);
    perception = Perception(
        proficiency: perceptionProficiency ?? ProficiencyType.normal);
    survival =
        Survival(proficiency: survivalProficiency ?? ProficiencyType.normal);
  }
}

class Charisma extends AbilityModel {
  late Deception deception;
  late Intimidation intimidation;
  late Performance performance;
  late Persuasion persuasion;

  Charisma({
    int? value,
    ProficiencyType? proficiency,
    ProficiencyType? deceptionProficiency,
    ProficiencyType? intimidationProficiency,
    ProficiencyType? performanceProficiency,
    ProficiencyType? persuasionProficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.normal,
        ) {
    deception =
        Deception(proficiency: deceptionProficiency ?? ProficiencyType.normal);
    intimidation = Intimidation(
        proficiency: intimidationProficiency ?? ProficiencyType.normal);
    performance = Performance(
        proficiency: performanceProficiency ?? ProficiencyType.normal);
    persuasion = Persuasion(
        proficiency: persuasionProficiency ?? ProficiencyType.normal);
  }
}
