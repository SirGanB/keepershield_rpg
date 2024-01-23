import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';

class TablePage extends StatefulWidget {
  final TableModel table;
  const TablePage({super.key, required this.table});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: const Row(children: [
              SizedBox(width: 8),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
              CompCharacterPortrait(),
            ]),
          ),
        ),
        const Expanded(
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
        title: Text(
          widget.table.title.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      );
}
