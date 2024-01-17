import 'package:keepershield_rpg/models/_lib_model.dart';

class CharacterViewModel {
  final CharacterModel _character;

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
    List<bool> st = [];
    for (Map<String, bool> savingThrow in _character.savingThrows) {
      savingThrow.forEach((key, value) {
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
}
