import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/database/db_firestore.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
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
    await _loadCharacters();

    notifyListeners();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _loadCharacters() async {
    _characters.clear();

    if (auth.user != null && _characters.isEmpty) {
      final snapshot =
          await db.collection('users/${auth.user!.uid}/characters').get();

      for (var doc in snapshot.docs) {
        CharacterModel character = CharacterModel(
          id: doc.get('id') ?? '',
          name: doc.get('name') ?? '',
          race: doc.get('race') ?? '',
          classes: (doc.get('classes') as List<dynamic>?)
                  ?.map((item) =>
                      Map<String, int>.from(item as Map<String, dynamic>))
                  .toList() ??
              [],
          healthPoints: doc.get('healthPoints') ?? 0,
          abilityScores: (doc.get('abilityScores') as List<dynamic>?)
                  ?.map((item) =>
                      Map<String, int>.from(item as Map<String, dynamic>))
                  .toList() ??
              [],
          savingThrows: (doc.get('savingThrows') as List<dynamic>?)
                  ?.map((item) =>
                      Map<String, bool>.from(item as Map<String, dynamic>))
                  .toList() ??
              [],
          speed: doc.get('speed'),
          skills: (doc.get('skills') as List<dynamic>?)
                  ?.map((item) =>
                      Map<String, int>.from(item as Map<String, dynamic>))
                  .toList() ??
              [],
        );

        _characters.add(character);

        notifyListeners();
      }
    }
  }

  UnmodifiableListView<CharacterModel> get characters =>
      UnmodifiableListView(_characters);

  create({required CharacterModel character}) async {
    await db
        .collection('users/${auth.user!.uid}/characters')
        .doc(character.id)
        .set({
      'id': character.id,
      'name': character.name,
      'race': character.race,
      'classes': character.classes,
      'healthPoints': character.healthPoints,
      'abilityScores': character.abilityScores,
      'savingThrows': character.savingThrows,
      'speed': character.speed,
      'skills': character.skills,
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

  updateSkill(CharacterModel character, String skill, int newValue) async {
    int index = _characters.indexWhere((c) => c.id == character.id);

    if (index != -1) {
      for (int i = 0; i < _characters[index].skills.length; i++) {
        if (_characters[index].skills[i].containsKey(skill)) {
          _characters[index].skills[i][skill] = newValue;
          break;
        }
      }
    }

    await db
        .collection('users/${auth.user!.uid}/characters')
        .doc(character.id)
        .update({
      'skills': character.skills,
    });

    notifyListeners();
  }
}
