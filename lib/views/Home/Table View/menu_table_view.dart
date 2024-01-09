import 'dart:io';
import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:keepershield_rpg/components/comp_card_default.dart';
import 'package:keepershield_rpg/models/rpg_table.dart';
import 'package:keepershield_rpg/views/home/table%20view/table_view.dart';
import 'package:path_provider/path_provider.dart';

class MenuTableView extends StatefulWidget {
  const MenuTableView({super.key});

  @override
  _MenuTableViewState createState() => _MenuTableViewState();
}

class _MenuTableViewState extends State<MenuTableView> {
  List<RpgTable> collTables = [];
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTableFromJson();
  }

  Future<void> _loadTableFromJson() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}/data.json';

    // Verifica se o diretório existe, se não existir, cria
    if (!(await documentsDirectory.exists())) {
      await documentsDirectory.create(recursive: true);
    }

    // Verifica se o arquivo existe
    if (await File(path).exists()) {
      // Carrega as mesas do arquivo existente
      String data = await File(path).readAsString();
      Map<String, dynamic> jsonData = json.decode(data);

      List<dynamic> tablesData = jsonData['tables'];

      setState(() {
        collTables = tablesData
            .map((tableData) => RpgTable(
                  title: tableData['title'],
                  subtitle: tableData['subtitle'],
                ))
            .toList();
      });
    } else {
      // Cria um novo arquivo com uma lista vazia de mesas
      await File(path).writeAsString('{"tables": []}');
    }
  }

  @override
  Widget build(BuildContext context) {
    void deleteTable(String titulo) {
      setState(() {
        // Encontrar o índice do item a ser excluído
        int index = collTables.indexWhere((table) => table.title == titulo);

        // Verificar se o item foi encontrado
        if (index != -1) {
          // Remover o item da lista
          collTables.removeAt(index);

          // Salvar as alterações no arquivo JSON
          _saveTableToJson();
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[800],
      floatingActionButton: floatingActionButton(context),
      body: ListView(children: [
        for (final table in collTables)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TableView(table: table),
                ),
              );
            },
            child: CompCardDefault(
              title: table.title,
              subtitle: table.subtitle,
              onPressed: () => deleteTable(table.title),
            ),
          ),
      ]),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[900],
      onPressed: () {
        _showPopupAddTable(context);
      },
      child: const Icon(Icons.add, color: Colors.grey),
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
                  decoration: const InputDecoration(labelText: 'Nome da Mesa'),
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
                  _addTable();
                  Navigator.of(context).pop();
                  _limparCamposTexto();
                },
                child: const Text('Adicionar'),
              ),
            ]);
      },
    );
  }

  // Função para adicionar a nova mesa ao JSON
  void _addTable() {
    setState(() {
      // Obter valores dos controladores
      String novoTitulo = _tituloController.text;
      String novoSubtitulo = _subtituloController.text;

      // Adicionar nova mesa à lista
      if (novoTitulo.trim() != '' && novoSubtitulo.trim() != '') {
        collTables.add(RpgTable(title: novoTitulo, subtitle: novoSubtitulo));

        // Salvar as alterações no JSON
        _saveTableToJson();
      } else {
        _limparCamposTexto();
      }
    });
  }

  // Função para salvar as mesas no JSON
  void _saveTableToJson() async {
    // Obter o diretório de documentos do aplicativo
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}/data.json';

    // Converter a lista de mesas para uma lista de mapas
    List<Map<String, dynamic>> mesasJson =
        collTables.map((table) => table.toJson()).toList();

    // Converter a lista de mapas para uma string JSON
    String jsonData = json.encode({'tables': mesasJson});

    // Escrever a string JSON no arquivo
    File file = File(path);
    await file.writeAsString(jsonData);
  }

  void _limparCamposTexto() {
    _tituloController.clear();
    _subtituloController.clear();
  }
}
