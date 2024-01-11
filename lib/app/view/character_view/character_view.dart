import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/lib_components.dart';
import 'package:keepershield_rpg/model/lib_model.dart';

class CharacterSheetView extends StatefulWidget {
  final CharacterModel character;

  const CharacterSheetView({super.key, required this.character});

  @override
  State<CharacterSheetView> createState() => _CharacterSheetViewState();
}

class _CharacterSheetViewState extends State<CharacterSheetView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(),
      body: Column(children: [
        SizedBox(
          width: screenSize.width,
          child: Text(
            widget.character.name.toUpperCase(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: screenSize.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: screenSize.width,
          child: const Text(
            'Medium Humanoid, Lawful Good',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Text(
          'Classe: ${widget.character.classes}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Raça: ${widget.character.race}',
          style: const TextStyle(fontSize: 16),
        ),
        const LabelAbilityScoreWdgt(),
        const LabelSaveTrowWdgt(),
      ]),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Personagem'),
    );
  }
}
