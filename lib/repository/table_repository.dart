import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/database/db_firestore.dart';
import 'package:keepershield_rpg/model/lib_model.dart';
import 'package:keepershield_rpg/services/auth.service.dart';

class TableRepository extends ChangeNotifier {
  final List<TableModel> _tables = [];
  late String _user;
  late FirebaseFirestore db;
  late AuthService auth;

  TableRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readTables();

    notifyListeners();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  reloadTables() {
    if (_user == auth.user!.uid) return;
    _readTables();

    notifyListeners();
  }

  _readTables() async {
    _tables.clear();

    if (auth.user != null && _tables.isEmpty) {
      final snapshot =
          await db.collection('users/${auth.user!.uid}/tables').get();

      _user = auth.user!.uid;

      for (var doc in snapshot.docs) {
        TableModel table = TableModel(
            id: doc.get('id'),
            title: doc.get('title'),
            subtitle: doc.get('subtitle'));

        _tables.add(table);

        notifyListeners();
      }
    }
  }

  UnmodifiableListView<TableModel> get tables => UnmodifiableListView(_tables);

  create({required String title, required String subtitle}) async {
    final table = TableModel(
      id: '${auth.user!.uid}:${DateTime.now()}',
      title: title,
      subtitle: subtitle,
    );

    await db.collection('users/${auth.user!.uid}/tables').doc(table.id).set({
      'id': table.id,
      'title': table.title,
      'subtitle': table.subtitle,
    });

    _tables.add(table);

    notifyListeners();
  }

  read() async {
    final snapshot =
        await db.collection('users/${auth.user!.uid}/tables').get();
    for (var doc in snapshot.docs) {
      _tables.add(TableModel(
        id: doc.get('id'),
        title: doc.get('title'),
        subtitle: doc.get('subtitle'),
      ));

      notifyListeners();
    }
  }

  delete({required TableModel table}) async {
    await db
        .collection('users/${auth.user!.uid}/tables')
        .doc(table.id)
        .delete();

    _tables.remove(table);

    notifyListeners();
  }
}
