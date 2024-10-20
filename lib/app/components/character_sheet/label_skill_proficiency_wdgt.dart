import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/definitions.dart';

class SkillProficiencyWdgt extends StatelessWidget {
  final String title;
  final ProficiencyType proficiency;
  final int value;

  const SkillProficiencyWdgt({super.key, 
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
              color: proficiency == ProficiencyType.nonProficient
                  ? Theme.of(context).colorScheme.outline
                  : proficiency == ProficiencyType.proficient
                      ? Theme.of(context).colorScheme.primary
                      : Colors.amber,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 9,
                  color: proficiency == ProficiencyType.nonProficient
                      ? Theme.of(context).colorScheme.outline
                      : proficiency == ProficiencyType.proficient
                          ? Theme.of(context).colorScheme.primary
                          : Colors.amber,
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
                  color: proficiency == ProficiencyType.nonProficient
                      ? Theme.of(context).colorScheme.outline
                      : proficiency == ProficiencyType.proficient
                          ? Theme.of(context).colorScheme.primary
                          : Colors.amber,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  value > 0 ? '+$value' : '$value',
                  style: TextStyle(
                    fontSize: 8,
                    color: proficiency == ProficiencyType.nonProficient
                        ? Theme.of(context).colorScheme.outline
                        : proficiency == ProficiencyType.proficient
                            ? Theme.of(context).colorScheme.primary
                            : Colors.amber,
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
    if (proficiency == ProficiencyType.nonProficient) {
      return Icons.circle_outlined;
    } else if (proficiency == ProficiencyType.proficient) {
      return Icons.circle;
    } else {
      return Icons.star;
    }
  }
}
