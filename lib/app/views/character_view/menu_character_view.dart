import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/views/character_view/character_view.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:provider/provider.dart';

class MenuCharacterView extends StatefulWidget {
  const MenuCharacterView({super.key});

  @override
  State<MenuCharacterView> createState() => _MenuCharacterViewState();
}

class _MenuCharacterViewState extends State<MenuCharacterView> {
  late CharactersRepository characters;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    characters = Provider.of<CharactersRepository>(context);

    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
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
                          builder: (context) =>
                              CharacterView(character: coll.characters[i]),
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
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showPopupAddCharacter(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void _showPopupAddCharacter(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Criar Personagem'),
              content: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 100),
                child: Column(children: [
                  TextField(
                    maxLength: 20,
                    decoration:
                        const InputDecoration(labelText: 'Nome da Personagem'),
                    controller: _nameController,
                  ),
                ]),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    characters.create(name: _nameController.text);

                    _nameController.clear();

                    Navigator.pop(context);
                  },
                  child: const Text('Adicionar'),
                ),
              ]);
        });
  }
}
