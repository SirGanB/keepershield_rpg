import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/definitions.dart';

class LabelSavingThrowWdgt extends StatelessWidget {
  final ProficiencyType proficiency;
  final String title;
  final int value;

  const LabelSavingThrowWdgt({super.key, 
    required this.proficiency,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    bool proficiency = false;
    proficiency == ProficiencyType.nonProficient
        ? proficiency = false
        : proficiency = true;

    return SizedBox(
      height: 50,
      width: 105,
      child: Stack(
        children: [
          // Center Box Component
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 80),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
              ),
              child: Center(child: Text(title.toUpperCase())),
            ),
          ),

          // Left Component
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 6),
              width: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Checkbox(
                checkColor: Colors.white,
                side: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.outline),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: proficiency,
                onChanged: null,
              ),
            ),
          ),

          //Right Component
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  strokeAlign: 0.5,
                ),
              ),
              child: Center(
                child: Text(
                  value > 0 ? '+$value' : '$value',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
