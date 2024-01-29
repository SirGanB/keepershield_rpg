import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/definitions.dart';

class SkillProficiencyWdgt extends StatelessWidget {
  final String title;
  final ProficiencyType proficiency;
  final int value;

  const SkillProficiencyWdgt({
    required this.title,
    required this.proficiency,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 15,
            width: 25,
            child: Icon(
              _defineIcon(),
              size: 10,
              color:
                  proficiency == ProficiencyType.Expert ? Colors.amber : null,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 9,
                  color: proficiency == ProficiencyType.Expert
                      ? Colors.amber
                      : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 25,
              height: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: proficiency == ProficiencyType.Expert
                      ? Colors.amber
                      : Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  value > 0 ? '+$value' : '$value',
                  style: TextStyle(
                    fontSize: 8,
                    color: proficiency == ProficiencyType.Expert
                        ? Colors.amber
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData? _defineIcon() {
    if (proficiency == ProficiencyType.NonProficient) {
      return Icons.circle_outlined;
    } else if (proficiency == ProficiencyType.Proficient) {
      return Icons.circle;
    } else {
      return Icons.star;
    }
  }
}
