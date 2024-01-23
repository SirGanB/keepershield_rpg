import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/definitions.dart';

class LabelSavingThrowWdgt extends StatelessWidget {
  final String title;
  final ProficiencyType proficiency;
  final int value;

  LabelSavingThrowWdgt({
    required this.title,
    required this.proficiency,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    bool _proficiency = false;
    proficiency == ProficiencyType.normal
        ? _proficiency = false
        : _proficiency = true;

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
                color: Theme.of(context).colorScheme.background,
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
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: Checkbox(
                checkColor: Colors.white,
                side: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.outline),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: _proficiency,
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
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onBackground,
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
