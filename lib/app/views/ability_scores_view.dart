import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_ability_scores_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';

class AbilityScoresView extends StatefulWidget {
  final CharacterViewModel character;
  const AbilityScoresView({super.key, required this.character});

  @override
  State<AbilityScoresView> createState() => _AbilityScoresViewState();
}

class _AbilityScoresViewState extends State<AbilityScoresView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomDividerWdgt(title: 'Valores de Atributos'),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LabelAbilityScores(
              title: 'Força',
              ability: widget.character.atributes.strength,
            ),
            LabelAbilityScores(
              title: 'Destreza',
              ability: widget.character.atributes.dexterity,
            ),
            LabelAbilityScores(
              title: 'Constituição',
              ability: widget.character.atributes.constitution,
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LabelAbilityScores(
            title: 'Inteligência',
            ability: widget.character.atributes.intelligence,
          ),
          LabelAbilityScores(
            title: 'Sabedoria',
            ability: widget.character.atributes.wisdom,
          ),
          LabelAbilityScores(
            title: 'Carisma',
            ability: widget.character.atributes.charisma,
          ),
        ],
      ),
    ]);
  }
}
