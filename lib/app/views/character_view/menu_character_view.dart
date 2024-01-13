import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/model/lib_model.dart';
import 'character_view.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  List<CharacterModel> collCharacters = [
    CharacterModel(
      name: 'Mallaggor Skashraii',
      race: 'NoN',
      classes: [
        ClassModel(name: 'Rogue', level: 1),
        ClassModel(name: 'Monk', level: 1)
      ],
      owner: 'GanBzau',
      currentHP: 8,
      maxHP: 12,
      armorClass: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      for (final character in collCharacters)
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterSheetView(character: character),
              ),
            );
          },
          child: CustomCardWdgt(
            title: character.name,
            subtitle: character.classes,
          ),
        ),
    ]);
  }
}
