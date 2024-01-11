// ... (Importações)

// View (UI)
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/lib_components.dart';
import 'package:keepershield_rpg/app/view/table_view/table_view.dart';
import 'package:keepershield_rpg/view_model/menu_table_viewmodel.dart';

class MenuTableView extends StatefulWidget {
  const MenuTableView({super.key});

  @override
  _MenuTableViewState createState() => _MenuTableViewState();
}

class _MenuTableViewState extends State<MenuTableView> {
  final MenuTableViewModel _viewModel = MenuTableViewModel();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  _MenuTableViewState() {
    //_viewModel.loadTableFromJson();
  }
  @override
  void initState() {
    super.initState();
    internalInitialize();
  }

  void internalInitialize() async {
    print('internalInitialize');
    await _viewModel.loadTableFromJson();
    print('internalInitialize finalize');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      body: ListView(
        children: [
          for (final table in _viewModel.tables)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TableView(table: table),
                  ),
                );
              },
              child: CustomCardWdgt(
                title: table.title,
                subtitle: table.subtitle,
                onPressed: () => setState(() {
                  _viewModel.deleteTable(table.id);
                }),
              ),
            ),
        ],
      ),
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
                    setState(() {
                      _addTableAndCloseDialog();
                    });
                  },
                  child: const Text('Adicionar'),
                ),
              ]);
        });
  }

  void _addTableAndCloseDialog() {
    _viewModel.addTable(
      _tituloController.text,
      _subtituloController.text,
    );
    Navigator.of(context).pop();
    _tituloController.clear();
    _subtituloController.clear();
    _viewModel.loadTableFromJson();
  }
}
