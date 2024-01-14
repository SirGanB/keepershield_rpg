import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';

class LabelAbilityScoreWdgt extends StatelessWidget {
  const LabelAbilityScoreWdgt({super.key});

  @override
  Widget build(BuildContext context) {
    List<AbilityScoreModel> abilityScores = [
      AbilityScoreModel(name: 'FOR', value: 15),
      AbilityScoreModel(name: 'DES', value: 14),
      AbilityScoreModel(name: 'CON', value: 13),
      AbilityScoreModel(name: 'INT', value: 12),
      AbilityScoreModel(name: 'SAB', value: 10),
      AbilityScoreModel(name: 'CAR', value: 08),
    ];

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const CustomDividerWdgt(title: 'Pontos de Atributos'),
      SizedBox(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return buildAbilityScoreLabel(abilityScores, index);
          },
          itemCount: abilityScores.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    ]);
  }

  Widget buildAbilityScoreLabel(
      List<AbilityScoreModel> abilityScores, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          abilityScores[index].name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          '${abilityScores[index].value} (${abilityScores[index].modifier})',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
