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
    await _loadAll();

    notifyListeners();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _loadAll() async {
    _characters.clear();

    if (auth.user != null) {
      final snapshot =
          await db.collection('users/${auth.user!.uid}/characters').get();

      _characters.addAll(snapshot.docs.map((doc) {
        return CharacterModel(
          id: doc.get('id'),
          name: doc.get('name'),
          race: doc.get('race'),
          classes: List<Map<String, int>>.from((doc.get('classes') ?? [])
              .map((item) => Map<String, int>.from(item))),
          currentHealth: doc.get('currentHealth') ?? 1,
          maxHealth: doc.get('maxHealth') ?? 1,
          speed: doc.get('speed') ?? 9,
          atributes: List<Map<String, int>>.from((doc.get('atributes') ?? [])
              .map((item) => Map<String, int>.from(item))),
          saves: List<Map<String, bool>>.from((doc.get('saves') ?? [])
              .map((item) => Map<String, bool>.from(item))),
          skills: List<Map<String, int>>.from((doc.get('skills') ?? [])
              .map((item) => Map<String, int>.from(item))),
        );
      }));

      notifyListeners();
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
      'currentHealth': character.currentHealth,
      'maxHealth': character.maxHealth,
      'speed': character.speed,
      'atributes': character.atributes,
      'saves': character.saves,
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
}
