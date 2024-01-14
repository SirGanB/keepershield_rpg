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
          id: doc.get('id'),
          name: doc.get('name'),
          race: doc.get('race'),
          classes: (doc.get('classes') as List<dynamic>)
              .cast<Map<String, dynamic>>(),
          healthPoints: doc.get('healthPoints'),
          abilityScores:
              (doc.get('abilityScores') as List<dynamic>).cast<int>(),
          savingThrows: (doc.get('savingThrows') as List<dynamic>).cast<bool>(),
        );

        _characters.add(character);
      }

      notifyListeners();
    }
  }

  UnmodifiableListView<CharacterModel> get characters =>
      UnmodifiableListView(_characters);

  create({required String name}) async {
    var character = CharacterModel(
      id: auth.defineId(),
      name: name,
      race: '',
      classes: [
        {'class': '', 'level': 1},
      ],
      healthPoints: 10,
      abilityScores: [15, 14, 13, 12, 10, 8],
      savingThrows: [false, false, false, false, false, false],
    );

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
    });

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
