import 'package:flutter/material.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class CharacterProfileView extends StatefulWidget {
  final CharacterViewModel character;

  const CharacterProfileView({required this.character});

  @override
  State<CharacterProfileView> createState() => _CharacterProfileViewState();
}

class _CharacterProfileViewState extends State<CharacterProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(builder: (context, character, w) {
      return Container(
        color: Theme.of(context).colorScheme.background,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 200,
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildProperty(
                        icon: Icons.favorite,
                        title: 'Pontos de Vida',
                        text:
                            '${widget.character.currentHealth}/${widget.character.maxHealth}',
                      ),
                      _buildProperty(
                        icon: Icons.shield,
                        title: 'Classe de Armadura',
                        text: '${widget.character.defineArmorClass()}',
                      ),
                      _buildProperty(
                        icon: Icons.remove_red_eye,
                        title: 'Percepção Passiva',
                        text: '${widget.character.definePassivePerception()}',
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 3,
                          ),
                        ),
                        child: const Icon(Icons.question_mark, size: 50),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildProperty(
                        icon: Icons.transfer_within_a_station,
                        title: 'Velocidade de Movimento',
                        text: '9m',
                      ),
                      _buildProperty(
                        icon: Icons.sports_martial_arts,
                        title: 'Bônus de Proficiência',
                        text: '+${widget.character.proficiencyBonus}',
                      ),
                      _buildProperty(
                        icon: Icons.sports_kabaddi,
                        title: 'Bônus de Iniciativa',
                        text:
                            '+${widget.character.abilityScores.dexterity.modifier}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildTitleBar(context),
          ],
        ),
      );
    });
  }

  Widget _buildProperty({
    required String title,
    required String text,
    required IconData icon,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(icon, size: 18),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 80,
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        )
      ],
    );
  }

  Container _buildTitleBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.character.name.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                wordSpacing: 5,
                letterSpacing: 3,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
