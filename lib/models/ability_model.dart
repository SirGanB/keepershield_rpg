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
          proficiency: proficiency ?? ProficiencyType.NonProficient,
        ) {
    athletics = Athletics(
        proficiency: athleticsProficiency ?? ProficiencyType.NonProficient);
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
          proficiency: proficiency ?? ProficiencyType.NonProficient,
        ) {
    acrobatics = Acrobatics(
        proficiency: acrobaticsProficiency ?? ProficiencyType.NonProficient);
    sleightOfHand = SleightOfHand(
        proficiency: sleightOfHandProficiency ?? ProficiencyType.NonProficient);
    stealth = Stealth(
        proficiency: stealthProficiency ?? ProficiencyType.NonProficient);
  }
}

class Constitution extends AbilityModel {
  Constitution({
    int? value,
    ProficiencyType? proficiency,
  }) : super(
          value: value ?? 10,
          proficiency: proficiency ?? ProficiencyType.NonProficient,
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
          proficiency: proficiency ?? ProficiencyType.NonProficient,
        ) {
    arcana =
        Arcana(proficiency: arcanaProficiency ?? ProficiencyType.NonProficient);
    history = History(
        proficiency: historyProficiency ?? ProficiencyType.NonProficient);
    investigation = Investigation(
        proficiency: investigationProficiency ?? ProficiencyType.NonProficient);
    nature =
        Nature(proficiency: natureProficiency ?? ProficiencyType.NonProficient);
    religion = Religion(
        proficiency: religionProficiency ?? ProficiencyType.NonProficient);
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
          proficiency: proficiency ?? ProficiencyType.NonProficient,
        ) {
    animalHandling = AnimalHandling(
        proficiency:
            animalHandlingProficiency ?? ProficiencyType.NonProficient);
    insight = Insight(
        proficiency: insightProficiency ?? ProficiencyType.NonProficient);
    medicine = Medicine(
        proficiency: medicineProficiency ?? ProficiencyType.NonProficient);
    perception = Perception(
        proficiency: perceptionProficiency ?? ProficiencyType.NonProficient);
    survival = Survival(
        proficiency: survivalProficiency ?? ProficiencyType.NonProficient);
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
          proficiency: proficiency ?? ProficiencyType.NonProficient,
        ) {
    deception = Deception(
        proficiency: deceptionProficiency ?? ProficiencyType.NonProficient);
    intimidation = Intimidation(
        proficiency: intimidationProficiency ?? ProficiencyType.NonProficient);
    performance = Performance(
        proficiency: performanceProficiency ?? ProficiencyType.NonProficient);
    persuasion = Persuasion(
        proficiency: persuasionProficiency ?? ProficiencyType.NonProficient);
  }
}
