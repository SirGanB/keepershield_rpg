import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/ability_score.dart';

class CompLabelAbilityScore extends StatefulWidget {
  const CompLabelAbilityScore({super.key});

  @override
  State<CompLabelAbilityScore> createState() => _CompLabelAbilityScoreState();
}

class _CompLabelAbilityScoreState extends State<CompLabelAbilityScore> {
  @override
  Widget build(BuildContext context) {
    var widthScreenSize = MediaQuery.of(context).size.width;
    int columnsCount = widthScreenSize > 600 ? 6 : 3;
    double childAspectRatio = widthScreenSize > 600
        ? widthScreenSize * 0.002
        : widthScreenSize * 0.004;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Divider(height: 20, thickness: 2),
      SizedBox(
        width: widthScreenSize,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnsCount,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return _buildStatWidget('Stat $index', 10 + index * 2);
          },
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
      const Divider(height: 20, thickness: 2),
    ]);
  }
}

Widget _buildStatWidget(String label, int value) {
  int modifier = AbilityScore.calcModifier(value: value);
  return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Text(
      label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text(
      '$value (${modifier < 0 ? '$modifier' : '+$modifier'})',
      style: const TextStyle(fontSize: 20),
    ),
  ]);
}

//_buildStatWidget('Força', 15),
//_buildStatWidget('Destreza', 14),
//_buildStatWidget('Constituição', 13),
//_buildStatWidget('Inteligência', 12),
//_buildStatWidget('Sabedoria', 10),
//_buildStatWidget('Carisma', 8),