import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/components/character_sheet/stats_btn_wdgt.dart';
import 'package:keepershield_rpg/app/views/character_view/character_view.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuCharacterView extends StatefulWidget {
  const MenuCharacterView({super.key});

  @override
  State<MenuCharacterView> createState() => _MenuCharacterViewState();
}

class _MenuCharacterViewState extends State<MenuCharacterView> {
  late CharactersRepository characters;

  // Step 1
  final _raceController = TextEditingController();
  final _classController = TextEditingController();

  // Step 2
  final _strController = TextEditingController();
  final _dexController = TextEditingController();
  final _conController = TextEditingController();
  final _intController = TextEditingController();
  final _wisController = TextEditingController();
  final _chaController = TextEditingController();

  // Step 3
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    characters = Provider.of<CharactersRepository>(context);

    return Scaffold(
      body: Consumer<CharactersRepository>(builder: (context, coll, w) {
        return coll.characters.isEmpty
            ? const Center(child: Text('Vazio'))
            : ListView.builder(
                itemCount: coll.characters.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterView(
                            character: CharacterViewModel(
                                character: coll.characters[i]),
                          ),
                        ),
                      );
                    },
                    child: CustomCardWdgt(
                      title: coll.characters[i].name,
                      subtitle: coll.characters[i].getClasses(),
                      onPressed: () => characters.delete(coll.characters[i]),
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

  void _showPopupStep1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '1. Escolha uma Raça'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _raceController,
                      maxLength: 20,
                      decoration: const InputDecoration(labelText: 'Raça'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '2. Escolha uma Classe'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _classController,
                      maxLength: 20,
                      decoration: const InputDecoration(labelText: 'Classe'),
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
                    Text(
                      '3. Valores de Atributos'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StatsBtnWdgt(
                            controller: _strController,
                            enabled: true,
                            title: 'For',
                          ),
                          StatsBtnWdgt(
                            controller: _dexController,
                            enabled: true,
                            title: 'Des',
                          ),
                          StatsBtnWdgt(
                            controller: _conController,
                            enabled: true,
                            title: 'Con',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StatsBtnWdgt(
                            controller: _intController,
                            enabled: true,
                            title: 'Int',
                          ),
                          StatsBtnWdgt(
                            controller: _wisController,
                            enabled: true,
                            title: 'Sab',
                          ),
                          StatsBtnWdgt(
                            controller: _chaController,
                            enabled: true,
                            title: 'Car',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                    Text(
                      '4. Nome do Personagem'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextField(
                        controller: _nameController,
                        maxLength: 20,
                        decoration: const InputDecoration(labelText: 'Nome'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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

                              _raceController.clear();
                              _classController.clear();
                              _nameController.clear();
                              _strController.clear();
                              _dexController.clear();
                              _conController.clear();
                              _intController.clear();
                              _wisController.clear();
                              _chaController.clear();
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
    final auth = context.read<AuthService>();
    final CharacterModel character;

    character = CharacterModel(
      id: auth.defineId(),
      name: _nameController.text.trimRight().trimLeft(),
      race: _raceController.text.trimRight().trimLeft(),
      classes: [
        {_classController.text.trimRight().trimLeft(): 1}
      ],
      healthPoints: 0,
      abilityScores: [
        {'For': int.parse(_strController.text)},
        {'Des': int.parse(_dexController.text)},
        {'Con': int.parse(_conController.text)},
        {'Int': int.parse(_intController.text)},
        {'Sab': int.parse(_wisController.text)},
        {'Car': int.parse(_chaController.text)},
      ],
      savingThrows: [
        {'For': false},
        {'Des': false},
        {'Con': false},
        {'Int': false},
        {'Sab': false},
        {'Car': false},
      ],
      speed: 9,
    );

    characters.create(character: character);
  }
}
