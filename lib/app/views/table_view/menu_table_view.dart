import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/repository/table_repository.dart';
import 'package:provider/provider.dart';

class MenuTableView extends StatefulWidget {
  const MenuTableView({super.key});

  @override
  _MenuTableViewState createState() => _MenuTableViewState();
}

class _MenuTableViewState extends State<MenuTableView> {
  late TableRepository tables;
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    tables = Provider.of<TableRepository>(context);
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      body: Consumer<TableRepository>(builder: (context, coll, w) {
        return coll.tables.isEmpty
            ? const Center(child: Text('Vazio'))
            : ListView.builder(
                itemCount: coll.tables.length,
                itemBuilder: (_, i) {
                  return CustomCardWdgt(
                    title: coll.tables[i].title,
                    subtitle: coll.tables[i].subtitle,
                    onPressed: () => tables.delete(
                      table: coll.tables[i],
                    ),
                  );
                },
              );
      }),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showPopupAddTable(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void _showPopupAddTable(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Adicionar Mesa'),
              content: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: Column(children: [
                  TextField(
                    maxLength: 20,
                    decoration:
                        const InputDecoration(labelText: 'Nome da Mesa'),
                    controller: _tituloController,
                  ),
                  TextField(
                    maxLength: 40,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    controller: _subtituloController,
                  ),
                ]),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    tables.create(
                      title: _tituloController.text,
                      subtitle: _subtituloController.text,
                    );

                    _tituloController.clear();
                    _subtituloController.clear();

                    Navigator.pop(context);
                  },
                  child: const Text('Adicionar'),
                ),
              ]);
        });
  }
}
