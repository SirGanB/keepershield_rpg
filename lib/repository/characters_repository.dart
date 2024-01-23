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
            athletics: _intToProficiencyType(
              doc.get('abilityScores.strength.athletics'),
            ),
          ),
          dext: Dexterity(
            value: (doc.get('abilityScores.dexterity.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.dexterity.proficiency'),
            ),
            acrobatics: _intToProficiencyType(
              doc.get('abilityScores.dexterity.acrobatics'),
            ),
            sleightOfHands: _intToProficiencyType(
              doc.get('abilityScores.dexterity.sleightOfHands'),
            ),
            stealth: _intToProficiencyType(
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
            arcana: _intToProficiencyType(
              doc.get('abilityScores.intelligence.arcana'),
            ),
            history: _intToProficiencyType(
              doc.get('abilityScores.intelligence.history'),
            ),
            investigation: _intToProficiencyType(
              doc.get('abilityScores.intelligence.investigation'),
            ),
            nature: _intToProficiencyType(
              doc.get('abilityScores.intelligence.nature'),
            ),
            religion: _intToProficiencyType(
              doc.get('abilityScores.intelligence.religion'),
            ),
          ),
          wisd: Wisdom(
            value: (doc.get('abilityScores.wisdom.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.wisdom.proficiency'),
            ),
            animalHandling: _intToProficiencyType(
              doc.get('abilityScores.wisdom.animalHandling'),
            ),
            insight: _intToProficiencyType(
              doc.get('abilityScores.wisdom.insight'),
            ),
            medicine: _intToProficiencyType(
              doc.get('abilityScores.wisdom.medicine'),
            ),
            perception: _intToProficiencyType(
              doc.get('abilityScores.wisdom.perception'),
            ),
            survival: _intToProficiencyType(
              doc.get('abilityScores.wisdom.survival'),
            ),
          ),
          char: Charisma(
            value: (doc.get('abilityScores.charisma.value') ?? 10) as int,
            proficiency: _intToProficiencyType(
              doc.get('abilityScores.charisma.proficiency'),
            ),
            deception: _intToProficiencyType(
              doc.get('abilityScores.charisma.deception'),
            ),
            intimidation: _intToProficiencyType(
              doc.get('abilityScores.charisma.intimidation'),
            ),
            performance: _intToProficiencyType(
              doc.get('abilityScores.charisma.performance'),
            ),
            persuasion: _intToProficiencyType(
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
      case ProficiencyType.normal:
        return 0;
      case ProficiencyType.proficient:
        return 1;
      case ProficiencyType.expert:
        return 2;
    }
  }

  ProficiencyType _intToProficiencyType(int value) {
    switch (value) {
      case 0:
        return ProficiencyType.normal;
      case 1:
        return ProficiencyType.proficient;
      case 2:
        return ProficiencyType.expert;
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
        'athletics':
            proficiencyTypeToInt(character.abilityScores.strength.athletics),
      },
      'dexterity': {
        'value': character.abilityScores.dexterity.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.dexterity.proficiency),
        'acrobatics':
            proficiencyTypeToInt(character.abilityScores.dexterity.acrobatics),
        'sleightOfHands': proficiencyTypeToInt(
            character.abilityScores.dexterity.sleightOfHands),
        'stealth':
            proficiencyTypeToInt(character.abilityScores.dexterity.stealth),
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
        'arcana':
            proficiencyTypeToInt(character.abilityScores.intelligence.arcana),
        'history':
            proficiencyTypeToInt(character.abilityScores.intelligence.history),
        'investigation': proficiencyTypeToInt(
            character.abilityScores.intelligence.investigation),
        'nature':
            proficiencyTypeToInt(character.abilityScores.intelligence.nature),
        'religion':
            proficiencyTypeToInt(character.abilityScores.intelligence.religion),
      },
      'wisdom': {
        'value': character.abilityScores.wisdom.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.wisdom.proficiency),
        'animalHandling':
            proficiencyTypeToInt(character.abilityScores.wisdom.animalHandling),
        'insight': proficiencyTypeToInt(character.abilityScores.wisdom.insight),
        'medicine':
            proficiencyTypeToInt(character.abilityScores.wisdom.medicine),
        'perception':
            proficiencyTypeToInt(character.abilityScores.wisdom.perception),
        'survival':
            proficiencyTypeToInt(character.abilityScores.wisdom.survival),
      },
      'charisma': {
        'value': character.abilityScores.charisma.value,
        'proficiency':
            proficiencyTypeToInt(character.abilityScores.charisma.proficiency),
        'deception':
            proficiencyTypeToInt(character.abilityScores.charisma.deception),
        'intimidation':
            proficiencyTypeToInt(character.abilityScores.charisma.intimidation),
        'performance':
            proficiencyTypeToInt(character.abilityScores.charisma.performance),
        'persuasion':
            proficiencyTypeToInt(character.abilityScores.charisma.persuasion),
      },
    };

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
