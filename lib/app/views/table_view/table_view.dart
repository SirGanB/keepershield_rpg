import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/model/lib_model.dart';

class TableView extends StatelessWidget {
  final TableModel table;
  const TableView({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: const Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            SizedBox(width: 8),
            CompCharacterPortrait(),
            CompCharacterPortrait(),
            CompCharacterPortrait(),
          ]),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }

  AppBar appbar() => AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Text(
          table.title.toUpperCase(),
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      );
}
