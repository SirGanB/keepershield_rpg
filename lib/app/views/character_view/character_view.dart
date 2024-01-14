import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';

class CharacterView extends StatefulWidget {
  final CharacterModel character;

  const CharacterView({super.key, required this.character});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(),
      body: Column(children: [
        SizedBox(
          width: screenSize.width,
          child: Text(
            '',
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
          'Classe: ',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Raça: ',
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
