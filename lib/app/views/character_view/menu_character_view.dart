import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_atribute_wdgt.dart';
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
                          builder: (context) => CharacterView(
                            character: CharacterViewModel(
                                character: repository.characters[i]),
                          ),
                        ),
                      );
                    },
                    child: CustomCardWdgt(
                      title: repository.characters[i].name,
                      subtitle: repository.characters[i].getClasses(),
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
                          LabelAtributeWdgt(
                            controller: _strController,
                            title: 'For',
                          ),
                          LabelAtributeWdgt(
                            controller: _dexController,
                            title: 'Des',
                          ),
                          LabelAtributeWdgt(
                            controller: _conController,
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
                          LabelAtributeWdgt(
                            controller: _intController,
                            title: 'Int',
                          ),
                          LabelAtributeWdgt(
                            controller: _wisController,
                            title: 'Sab',
                          ),
                          LabelAtributeWdgt(
                            controller: _chaController,
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
        {'Strenght': int.parse(_strController.text)},
        {'Dexterity': int.parse(_dexController.text)},
        {'Constitution': int.parse(_conController.text)},
        {'Intelligence': int.parse(_intController.text)},
        {'Wisdom': int.parse(_wisController.text)},
        {'Charisma': int.parse(_chaController.text)},
      ],
      savingThrows: [
        {'Strenght': false},
        {'Dexterity': false},
        {'Constitution': false},
        {'Intelligence': false},
        {'Wisdom': false},
        {'Charisma': false},
      ],
      skills: [
        {'Athletics': 0},
        {'Acrobatics': 0},
        {'Stealth': 0},
        {'Sleight of Hand': 0},
        {'Arcana': 0},
        {'History': 0},
        {'Investigation': 0},
        {'Nature': 0},
        {'Religion': 0},
        {'Insight': 0},
        {'Animal Handling': 0},
        {'Medicine': 0},
        {'Perception': 0},
        {'Survival': 0},
        {'Performance': 0},
        {'Deception': 0},
        {'Intimidation': 0},
        {'Persuasion': 0},
      ],
      speed: 9,
    );

    characters.create(character: character);
  }
}
