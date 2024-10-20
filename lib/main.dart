import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/views/my_app.dart';
import 'package:keepershield_rpg/repository/_lib_repository.dart';
import 'package:provider/provider.dart';

import 'objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Abre o armazenamento ObjectBox
  final store = await openStore();

  runApp(
    MultiProvider(
      providers: [
        // Fornecendo a instância do Store
        Provider<Store>.value(value: store),
        ChangeNotifierProvider(
          create: (context) =>
              CharactersRepository(store), // Passa o Store para o repositório
        ),
      ],
      child: const MyApp(),
    ),
  );
}
