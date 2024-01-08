import 'package:flutter/material.dart';
import 'package:rpg_keeper_hub/components/comp_character_portrait.dart';
import 'package:rpg_keeper_hub/models/rpg_table.dart';

class TableView extends StatelessWidget {
  final RpgTable table;
  const TableView({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(children: [
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
            ],
          ),
        ),
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 500,
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 500,
              color: Colors.blue,
            ),
          ),
        ]),
      ]),
    );
  }

  AppBar appbar() => AppBar(
        iconTheme: IconThemeData(color: Colors.grey[300]),
        title: Text(
          table.title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      );
}
