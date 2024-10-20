import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/pages/character_page.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuCharacterPage extends StatefulWidget {
  const MenuCharacterPage({super.key});

  @override
  _MenuCharacterPageState createState() => _MenuCharacterPageState();
}

class _MenuCharacterPageState extends State<MenuCharacterPage> {
  late CharactersRepository _charactersRepository;

  @override
  void initState() {
    super.initState();
    _initializeRepository();
  }

  Future<void> _initializeRepository() async {
    _charactersRepository =
        Provider.of<CharactersRepository>(context, listen: false);
    await _charactersRepository.initialize(); // Aguarda a inicialização
    setState(() {}); // Atualiza a interface após a inicialização
  }

  void _createCharacter() {
    if (_charactersRepository.isInitialized) {
      // Criar um novo personagem (você pode personalizar esse CharacterModel)
      final newCharacter = CharacterModel(
        // Defina os atributos necessários para criar um personagem
        name: 'Novo Personagem',
        // Outros atributos
      );
      _charactersRepository.create(character: newCharacter);
    } else {
      // Exiba uma mensagem de erro ou aguarde a inicialização
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O repositório não está inicializado.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Personagens')),
      body: Consumer<CharactersRepository>(
        builder: (context, repository, child) {
          if (!repository.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          final characters = repository.characters;

          if (characters.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: const Text(
                      'Você ainda não possui personagens criados. Vamos criar seu primeiro personagem?',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _createCharacter,
                    child: const Text('Vamos lá!'),
                  ),
                ],
              ),
            );
          }

          // Se houver personagens, exiba a lista
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return CustomCardWdgt(
                title: character.name,
                subtitle: character.race,
                onPressed: () {
                  repository.delete(character);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterPage(
                          character: CharacterViewModel(char: character)),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createCharacter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
