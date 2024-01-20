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
              modifier: widget.character.atributes[0].modifier,
              score: widget.character.atributes[0].value,
            ),
            LabelAbilityScores(
              title: 'Destreza',
              modifier: widget.character.atributes[1].modifier,
              score: widget.character.atributes[1].value,
            ),
            LabelAbilityScores(
              title: 'Constituição',
              modifier: widget.character.atributes[2].modifier,
              score: widget.character.atributes[2].value,
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LabelAbilityScores(
            title: 'Inteligência',
            modifier: widget.character.atributes[3].modifier,
            score: widget.character.atributes[3].value,
          ),
          LabelAbilityScores(
            title: 'Sabedoria',
            modifier: widget.character.atributes[4].modifier,
            score: widget.character.atributes[4].value,
          ),
          LabelAbilityScores(
            title: 'Carisma',
            modifier: widget.character.atributes[5].modifier,
            score: widget.character.atributes[5].value,
          ),
        ],
      ),
    ]);
  }
}
