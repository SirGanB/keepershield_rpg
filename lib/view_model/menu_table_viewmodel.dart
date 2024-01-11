import 'dart:convert';
import 'dart:io';
import 'package:keepershield_rpg/model/lib_model.dart';
import 'package:path_provider/path_provider.dart';

class MenuTableViewModel {
  List<TableModel> tables = [];

  Future<void> loadTableFromJson() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = '${documentsDirectory.path}/data.json';

      if (!(await documentsDirectory.exists())) {
        await documentsDirectory.create(recursive: true);
      }

      if (await File(path).exists()) {
        String data = await File(path).readAsString();
        Map<String, dynamic> jsonData = json.decode(data);

        List<dynamic> tablesData = jsonData['tables'];

        tables = tablesData
            .map((tableData) => TableModel(
                  id: tableData['id'],
                  title: tableData['title'],
                  subtitle: tableData['subtitle'],
                ))
            .toList();
      } else {
        await File(path).writeAsString('{"tables": []}');
      }
    } catch (e) {
      // Lidar com a exceção, por exemplo, imprimir o erro
      print('Erro durante a carga do arquivo JSON: $e');
    }
  }

  Future<void> saveTableToJson() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = '${documentsDirectory.path}/data.json';

      List<Map<String, dynamic>> mesasJson =
          tables.map((table) => table.toJson()).toList();

      String jsonData = json.encode({'tables': mesasJson});

      File file = File(path);
      await file.writeAsString(jsonData);
    } catch (e) {
      // Lidar com a exceção, por exemplo, imprimir o erro
      print('Erro durante a gravação do arquivo JSON: $e');
    }
  }

  void addTable(String title, String subtitle) {
    if (title.trim().isNotEmpty && subtitle.trim().isNotEmpty) {
      tables.add(TableModel(
        id: DateTime.now().toString(),
        title: title,
        subtitle: subtitle,
      ));

      saveTableToJson();
    }
  }

  void deleteTable(String id) {
    int index = tables.indexWhere((table) => table.id == id);

    if (index >= 0) {
      tables.removeAt(index);
      saveTableToJson();
    }
  }
}
