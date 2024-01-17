import 'package:flutter/material.dart';

class SkillProficiencyWdgt extends StatelessWidget {
  final int value;
  final int proficiency;
  final String title;

  const SkillProficiencyWdgt({
    super.key,
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
              color: proficiency == 2 ? Colors.amber : null,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 9,
                  color: proficiency == 2 ? Colors.amber : null,
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
                  color: proficiency == 2
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
                    color: proficiency == 2 ? Colors.amber : null,
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
    if (proficiency == 0) {
      return Icons.circle_outlined;
    } else if (proficiency == 1) {
      return Icons.circle;
    } else {
      return Icons.star;
    }
  }
}
