import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/pages/character_page.dart';
import 'package:keepershield_rpg/models/character_model.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuCharacterPage extends StatefulWidget {
  const MenuCharacterPage({super.key});

  @override
  State<MenuCharacterPage> createState() => _MenuCharacterPageState();
}

class _MenuCharacterPageState extends State<MenuCharacterPage> {
  late CharactersRepository characters;

  final _classController = TextEditingController();
  final _nameController = TextEditingController();
  final _raceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    characters = Provider.of<CharactersRepository>(context);

    return Scaffold(
      body: Consumer<CharactersRepository>(builder: (context, repository, w) {
        return repository.characters.isEmpty
            ? const Center(child: Text('Vazio'))
            : ListView.builder(
                itemCount: repository.characters.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterPage(
                            character: CharacterViewModel(
                              character: repository.characters[i],
                              repository: repository,
                            ),
                          ),
                        ),
                      );
                    },
                    child: CustomCardWdgt(
                      title: repository.characters[i].name,
                      subtitle: repository.characters[i].race +
                          ', ' +
                          repository.characters[i].classes.first.keys.first,
                      onPressed: () =>
                          characters.delete(repository.characters[i]),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showPopupStep1(context),
      ),
    );
  }

  Widget _buildTitle({required int step}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Text(
        'Criação de\nPersonagem'.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildCustomInsertLabel({
    required String text,
    required String labelText,
    required TextEditingController controller,
  }) {
    return SizedBox(
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            controller: controller,
            maxLength: 20,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void _showPopupStep1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTitle(step: 1),
                    _buildCustomInsertLabel(
                      text: '1. Informe a raça',
                      labelText: 'Raça',
                      controller: _raceController,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextButton(
                          child: Icon(
                            Icons.navigate_next,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _showPopupStep2(context);
                          },
                        ),
                      ),
                    )
                  ]),
            ),
          );
        });
  }

  void _showPopupStep2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTitle(step: 2),
                    _buildCustomInsertLabel(
                      text: '2. Informe a classe',
                      labelText: 'Classe',
                      controller: _classController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            child: Icon(
                              Icons.navigate_before,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _showPopupStep1(context);
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            child: Icon(
                              Icons.navigate_next,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _showPopupStep3(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  void _showPopupStep3(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTitle(step: 3),
                    _buildCustomInsertLabel(
                        text: '3. Informe o nome',
                        labelText: 'Nome do Personagem',
                        controller: _nameController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            child: Icon(
                              Icons.navigate_before,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _showPopupStep2(context);
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            child: Text(
                              'Finalizar'.toUpperCase(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              _createCharacter();

                              _nameController.clear();
                              _raceController.clear();
                              _classController.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  void _createCharacter() {
    characters.create(
      character: CharacterModel(
        name: _nameController.text,
        race: _raceController.text,
        classes: [
          <String, int>{_classController.text: 1},
        ],
      ),
    );
  }
}
