import 'package:flutter/material.dart';
import '../../components/character_sheet_view.dart';
import '../../components/comp_card_default.dart';
import '../../models/character.dart';
import '../../models/class.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  List<Character> collCharacters = [
    Character(
      name: 'João de Santo Cristo',
      race: 'Human',
      collClasses: [
        Class(name: 'Rogue', level: 1),
        Class(name: 'Monk', level: 1)
      ],
      owner: 'GanBzau',
      currentHP: 8,
      maxHP: 12,
      armorClass: 10,
    ),
    Character(
      name: 'Mallaggor Skashraii',
      race: 'Half-Elf',
      collClasses: [Class(name: 'Warlock', level: 12)],
      owner: 'GanBzau',
      currentHP: 666,
      maxHP: 666,
      armorClass: 22,
    ),
    Character(
      name: 'Gustavo M. Novaes',
      race: 'Human',
      collClasses: [Class(name: 'Paladin', level: 3)],
      owner: 'GanBzau',
      currentHP: 333,
      maxHP: 333,
      armorClass: 18,
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
          child: CompCardDefault(
            title: character.name,
            subtitle: character.classes,
          ),
        ),
    ]);
  }
}
