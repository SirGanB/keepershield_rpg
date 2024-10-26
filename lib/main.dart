import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/pages/home_page.dart';
import 'package:keepershield_rpg/objectbox.g.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Garante que o Flutter esteja pronto para executar o código assíncrono
  WidgetsFlutterBinding.ensureInitialized();

  // Obtenha o diretório de arquivos do aplicativo para evitar problemas de permissão
  final directory = await getApplicationDocumentsDirectory();

  // Cria a loja do ObjectBox usando o diretório de arquivos do aplicativo
  final store = Store(
    getObjectBoxModel(),
    directory: '${directory.path}/objectbox',
  );

  // Cria e inicializa o repositório de personagens
  final charactersRepository = CharactersRepository(store);
  await charactersRepository.initialize(); // Inicializa antes de passar ao Provider

  // Executa o aplicativo com o repositório inicializado
  runApp(MyApp(charactersRepository: charactersRepository));
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  final CharactersRepository charactersRepository; // Recebe o repositório inicializado

  const MyApp({super.key, required this.charactersRepository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Fornece o repositório de personagens já inicializado ao contexto
        ChangeNotifierProvider(
          create: (_) => charactersRepository,
        ),
      ],
      child: SafeArea(
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
