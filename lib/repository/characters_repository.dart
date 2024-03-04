import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/database/db_firestore.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/models/ability_model.dart';
import 'package:keepershield_rpg/services/auth.service.dart';

class CharactersRepository extends ChangeNotifier {
  final List<CharacterModel> _characters = [];
  late FirebaseFirestore db;
  late AuthService auth;

  CharactersRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _loadAll();

    notifyListeners();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  Future<void> _loadAll() async {
    _characters.clear();

    var querySnapshot =
        await db.collection('users/${auth.user!.uid}/characters').get();

    for (var doc in querySnapshot.docs) {
      var classesData = doc.get('classes') ?? [];
      var classes = (classesData as List<dynamic>).cast<Map<String, dynamic>>();

      var character = CharacterModel(
        id: doc.get('id'),
        name: doc.get('name'),
        race: doc.get('race'),
        classes: classes.map((item) => Map<String, int>.from(item)).toList(),
        currentHealth: doc.get('currentHealth'),
        maxHealth: doc.get('maxHealth'),
        speed: doc.get('speed'),
        abilities: AbilityScoresCollection(
          stre: Strength(
            value: (doc.get('abilityScores.strength.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.strength.proficiency'),
            ),
            athleticsProficiency: _intToProficiencyType(
              doc.get('abilityScores.strength.athletics'),
            ),
          ),
          dext: Dexterity(
            value: (doc.get('abilityScores.dexterity.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.dexterity.proficiency'),
            ),
            acrobaticsProficiency: _intToProficiencyType(
              doc.get('abilityScores.dexterity.acrobatics'),
            ),
            sleightOfHandProficiency: _intToProficiencyType(
              doc.get('abilityScores.dexterity.sleightOfHands'),
            ),
            stealthProficiency: _intToProficiencyType(
              doc.get('abilityScores.dexterity.stealth'),
            ),
          ),
          cons: Constitution(
            value: (doc.get('abilityScores.constitution.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.constitution.proficiency'),
            ),
          ),
          inte: Intelligence(
            value: (doc.get('abilityScores.intelligence.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.proficiency'),
            ),
            arcanaProficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.arcana'),
            ),
            historyProficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.history'),
            ),
            investigationProficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.investigation'),
            ),
            natureProficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.nature'),
            ),
            religionProficiency: _intToProficiencyType(
              doc.get('abilityScores.intelligence.religion'),
            ),
          ),
          wisd: Wisdom(
            value: (doc.get('abilityScores.wisdom.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.proficiency'),
            ),
            animalHandlingProficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.animalHandling'),
            ),
            insightProficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.insight'),
            ),
            medicineProficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.medicine'),
            ),
            perceptionProficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.perception'),
            ),
            survivalProficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.survival'),
            ),
          ),
          char: Charisma(
            value: (doc.get('abilityScores.charisma.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.proficiency'),
            ),
            deceptionProficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.deception'),
            ),
            intimidationProficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.intimidation'),
            ),
            performanceProficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.performance'),
            ),
            persuasionProficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.persuasion'),
            ),
          ),
        ),
      );
      _characters.add(character);
    }
  }

  int proficiencyTypeToInt(ProficiencyType proficiency) {
    switch (proficiency) {
      case ProficiencyType.NonProficient:
        return 0;
      case ProficiencyType.Proficient:
        return 1;
      case ProficiencyType.Expert:
        return 2;
    }
  }

  ProficiencyType _intToProficiencyType(int value) {
    switch (value) {
      case 0:
        return ProficiencyType.NonProficient;
      case 1:
        return ProficiencyType.Proficient;
      case 2:
        return ProficiencyType.Expert;
      default:
        throw ArgumentError('Valor de ProficiencyType desconhecido: $value');
    }
  }

  UnmodifiableListView<CharacterModel> get characters =>
      UnmodifiableListView(_characters);

  create({required CharacterModel character}) async {
    Map<String, dynamic> abilityScoresData = {
      'strength': {
        'value': character.abilityScores.strength.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.strength.proficiency),
        'athletics': proficiencyTypeToInt(
            character.abilityScores.strength.athletics.proficiency),
      },
      'dexterity': {
        'value': character.abilityScores.dexterity.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.dexterity.proficiency),
        'acrobatics': proficiencyTypeToInt(
            character.abilityScores.dexterity.acrobatics.proficiency),
        'sleightOfHands': proficiencyTypeToInt(
            character.abilityScores.dexterity.sleightOfHand.proficiency),
        'stealth': proficiencyTypeToInt(
            character.abilityScores.dexterity.stealth.proficiency),
      },
      'constitution': {
        'value': character.abilityScores.constitution.value,
        'proficiency': proficiencyTypeToInt(
            character.abilityScores.constitution.proficiency),
      },
      'intelligence': {
        'value': character.abilityScores.intelligence.value,
        'proficiency': proficiencyTypeToInt(
            character.abilityScores.intelligence.proficiency),
        'arcana': proficiencyTypeToInt(
            character.abilityScores.intelligence.arcana.proficiency),
        'history': proficiencyTypeToInt(
            character.abilityScores.intelligence.history.proficiency),
        'investigation': proficiencyTypeToInt(
            character.abilityScores.intelligence.investigation.proficiency),
        'nature': proficiencyTypeToInt(
            character.abilityScores.intelligence.nature.proficiency),
        'religion': proficiencyTypeToInt(
            character.abilityScores.intelligence.religion.proficiency),
      },
      'wisdom': {
        'value': character.abilityScores.wisdom.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.wisdom.proficiency),
        'animalHandling': proficiencyTypeToInt(
            character.abilityScores.wisdom.animalHandling.proficiency),
        'insight': proficiencyTypeToInt(
            character.abilityScores.wisdom.insight.proficiency),
        'medicine': proficiencyTypeToInt(
            character.abilityScores.wisdom.medicine.proficiency),
        'perception': proficiencyTypeToInt(
            character.abilityScores.wisdom.perception.proficiency),
        'survival': proficiencyTypeToInt(
            character.abilityScores.wisdom.survival.proficiency),
      },
      'charisma': {
        'value': character.abilityScores.charisma.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.charisma.proficiency),
        'deception': proficiencyTypeToInt(
            character.abilityScores.charisma.deception.proficiency),
        'intimidation': proficiencyTypeToInt(
            character.abilityScores.charisma.intimidation.proficiency),
        'performance': proficiencyTypeToInt(
            character.abilityScores.charisma.performance.proficiency),
        'persuasion': proficiencyTypeToInt(
            character.abilityScores.charisma.persuasion.proficiency),
      },
    };

    if (character.id.trim() == '') character.id = auth.defineId();

    await db
        .collection('users/${auth.user!.uid}/characters')
        .doc(character.id)
        .set({
      'id': character.id,
      'name': character.name,
      'race': character.race,
      'classes': character.classes,
      'abilityScores': abilityScoresData,
      'currentHealth': character.currentHealth,
      'maxHealth': character.maxHealth,
      'speed': character.speed,
    });

    _characters.removeWhere((char) => char.id == character.id);
    _characters.add(character);

    notifyListeners();
  }

  delete(CharacterModel character) async {
    await db
        .collection('users/${auth.user!.uid}/characters')
        .doc(character.id)
        .delete();

    _characters.remove(character);

    notifyListeners();
  }
}
