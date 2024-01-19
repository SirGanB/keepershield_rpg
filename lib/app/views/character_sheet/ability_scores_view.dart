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
              modifier: widget.character.strengthModifier,
              score: widget.character.strength,
            ),
            LabelAbilityScores(
              title: 'Destreza',
              modifier: widget.character.dexteryModifier,
              score: widget.character.dextery,
            ),
            LabelAbilityScores(
              title: 'Constituição',
              modifier: widget.character.constitutionModifier,
              score: widget.character.constitution,
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LabelAbilityScores(
            title: 'Inteligência',
            modifier: widget.character.intelligenceModifier,
            score: widget.character.intelligence,
          ),
          LabelAbilityScores(
            title: 'Sabedoria',
            modifier: widget.character.wisdomModifier,
            score: widget.character.wisdom,
          ),
          LabelAbilityScores(
            title: 'Carisma',
            modifier: widget.character.charismaModifier,
            score: widget.character.charisma,
          ),
        ],
      ),
    ]);
  }
}
