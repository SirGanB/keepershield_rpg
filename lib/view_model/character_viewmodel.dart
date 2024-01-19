import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:provider/provider.dart';

class CharacterViewModel {
  final CharacterModel _character;
  late CharactersRepository _charactersRepository;

  // Ability Scores
  late int strength;
  late int dextery;
  late int constitution;
  late int intelligence;
  late int wisdom;
  late int charisma;

  // Ability Modifiers
  late int strengthModifier;
  late int dexteryModifier;
  late int constitutionModifier;
  late int intelligenceModifier;
  late int wisdomModifier;
  late int charismaModifier;

  // Saving Trows
  late int strengthSavingThrow;
  late int dexterySavingThrow;
  late int constitutionSavingThrow;
  late int intelligenceSavingThrow;
  late int wisdomSavingThrow;
  late int charismaSavingThrow;

  // Saving Throws Proficiency
  late bool stStr;
  late bool stDex;
  late bool stCon;
  late bool stInt;
  late bool stWis;
  late bool stCha;

  // Skills
  late int athletics;
  late int acrobatics;
  late int stealth;
  late int sleightOfHand;
  late int arcana;
  late int history;
  late int investigation;
  late int nature;
  late int religion;
  late int insight;
  late int animalHandling;
  late int medicine;
  late int perception;
  late int survival;
  late int performance;
  late int deception;
  late int intimidation;
  late int persuasion;

  // Skill Proficiency
  late int athleticsProficiency;
  late int acrobaticsProficiency;
  late int stealthProficiency;
  late int sleightOfHandProficiency;
  late int arcanaProficiency;
  late int historyProficiency;
  late int investigationProficiency;
  late int natureProficiency;
  late int religionProficiency;
  late int insightProficiency;
  late int animalHandlingProficiency;
  late int medicineProficiency;
  late int perceptionProficiency;
  late int survivalProficiency;
  late int performanceProficiency;
  late int deceptionProficiency;
  late int intimidationProficiency;
  late int persuasionProficiency;

  // Character Stats
  late int characterLevel = 0;
  late int proficiencyBonus = 0;

  CharacterViewModel({required CharacterModel character})
      : _character = character {
    characterLevel = _defineCharacterLevel();

    strength = _character.abilityScores[0].values.first;
    dextery = _character.abilityScores[1].values.first;
    constitution = _character.abilityScores[2].values.first;
    intelligence = _character.abilityScores[3].values.first;
    wisdom = _character.abilityScores[4].values.first;
    charisma = _character.abilityScores[5].values.first;

    strengthModifier = _defineModifier(strength);
    dexteryModifier = _defineModifier(dextery);
    constitutionModifier = _defineModifier(constitution);
    intelligenceModifier = _defineModifier(intelligence);
    wisdomModifier = _defineModifier(wisdom);
    charismaModifier = _defineModifier(charisma);

    proficiencyBonus = _defineProcifiencyBonus();
    _defineSavingThrow();
    _defineSkills();
  }

  updateSkill({
    required BuildContext context,
    required String skill,
    required int value,
  }) {
    _charactersRepository =
        Provider.of<CharactersRepository>(context, listen: false);
    _charactersRepository.updateSkill(_character, skill, value);
  }

  String get name => _character.name;

  int _defineModifier(int value) => (value - 10) ~/ 2;

  int _defineCharacterLevel() {
    for (Map<String, int> mClass in _character.classes) {
      mClass.forEach((String name, int value) {
        characterLevel += value;
      });
    }

    return characterLevel;
  }

  int _defineProcifiencyBonus() => 2 + ((characterLevel - 1) ~/ 4);

  _defineSavingThrow() {
    List<bool> st = []; //Saving Throw
    for (Map<String, bool> savingThrows in _character.savingThrows) {
      savingThrows.forEach((key, value) {
        st.add(value);
      });
    }

    stStr = st[0];
    stDex = st[1];
    stCon = st[2];
    stInt = st[3];
    stWis = st[4];
    stCha = st[5];

    strengthSavingThrow =
        stStr ? strengthModifier + proficiencyBonus : strengthModifier;
    dexterySavingThrow =
        stDex ? dexteryModifier + proficiencyBonus : dexteryModifier;
    constitutionSavingThrow =
        stCon ? constitutionModifier + proficiencyBonus : constitutionModifier;
    intelligenceSavingThrow =
        stInt ? intelligenceModifier + proficiencyBonus : intelligenceModifier;
    wisdomSavingThrow =
        stWis ? wisdomModifier + proficiencyBonus : wisdomModifier;
    charismaSavingThrow =
        stCha ? charismaModifier + proficiencyBonus : charismaModifier;
  }

  _defineSkills() {
    List<int> sp = []; //Skill Proficiency

    for (Map<String, int> skills in _character.skills) {
      skills.forEach((key, value) {
        sp.add(value);
      });
    }

    athletics = _calcSkillValue(sp[0], strengthModifier);
    acrobatics = _calcSkillValue(sp[1], dexteryModifier);
    stealth = _calcSkillValue(sp[2], dexteryModifier);
    sleightOfHand = _calcSkillValue(sp[3], dexteryModifier);
    arcana = _calcSkillValue(sp[4], intelligenceModifier);
    history = _calcSkillValue(sp[5], intelligenceModifier);
    investigation = _calcSkillValue(sp[6], intelligenceModifier);
    nature = _calcSkillValue(sp[7], intelligenceModifier);
    religion = _calcSkillValue(sp[8], intelligenceModifier);
    insight = _calcSkillValue(sp[9], wisdomModifier);
    animalHandling = _calcSkillValue(sp[10], wisdomModifier);
    medicine = _calcSkillValue(sp[11], wisdomModifier);
    perception = _calcSkillValue(sp[12], wisdomModifier);
    survival = _calcSkillValue(sp[13], wisdomModifier);
    performance = _calcSkillValue(sp[14], charismaModifier);
    deception = _calcSkillValue(sp[15], charismaModifier);
    intimidation = _calcSkillValue(sp[16], charismaModifier);
    persuasion = _calcSkillValue(sp[17], charismaModifier);

    athleticsProficiency = sp[0];
    acrobaticsProficiency = sp[1];
    stealthProficiency = sp[2];
    sleightOfHandProficiency = sp[3];
    arcanaProficiency = sp[4];
    historyProficiency = sp[5];
    investigationProficiency = sp[6];
    natureProficiency = sp[7];
    religionProficiency = sp[8];
    insightProficiency = sp[9];
    animalHandlingProficiency = sp[10];
    medicineProficiency = sp[11];
    perceptionProficiency = sp[12];
    survivalProficiency = sp[13];
    performanceProficiency = sp[14];
    deceptionProficiency = sp[15];
    intimidationProficiency = sp[16];
    persuasionProficiency = sp[17];
  }

  int _calcSkillValue(int proficiency, int modifier) {
    if (proficiency == 0) {
      return modifier;
    } else if (proficiency == 1) {
      return modifier + proficiencyBonus;
    } else {
      return modifier + (proficiencyBonus * 2);
    }
  }
}
