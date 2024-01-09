import 'package:flutter/material.dart';
import 'package:keepershield_rpg/components/comp_character_portrait.dart';
import 'package:keepershield_rpg/models/rpg_table.dart';

class TableView extends StatelessWidget {
  final RpgTable table;
  const TableView({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      backgroundColor: Colors.grey[800],
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.grey,
            child: Row(
              children: [
                SizedBox(width: 8),
                CompCharacterPortrait(),
                CompCharacterPortrait(),
                CompCharacterPortrait(),
              ],
            ),
          ),
        ),
        Expanded(
            child: Center(
                child: Text(
          'Coming Soon',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ))),
      ]),
    );
  }

  AppBar appbar() => AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
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
