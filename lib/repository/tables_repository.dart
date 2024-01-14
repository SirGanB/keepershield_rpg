import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/database/db_firestore.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/services/auth.service.dart';

class TablesRepository extends ChangeNotifier {
  final List<TableModel> _tables = [];
  late FirebaseFirestore db;
  late AuthService auth;

  TablesRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _loadTables();

    notifyListeners();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _loadTables() async {
    _tables.clear();

    if (auth.user != null && _tables.isEmpty) {
      final snapshot =
          await db.collection('users/${auth.user!.uid}/tables').get();

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

  delete({required TableModel table}) async {
    await db
        .collection('users/${auth.user!.uid}/tables')
        .doc(table.id)
        .delete();

    _tables.remove(table);

    notifyListeners();
  }
}
