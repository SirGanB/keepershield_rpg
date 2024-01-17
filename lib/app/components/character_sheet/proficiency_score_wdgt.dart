import 'package:flutter/material.dart';

class ProficiencyScoreWdgt extends StatelessWidget {
  final int value;
  final IconData icon;
  final String title;

  const ProficiencyScoreWdgt({
    super.key,
    required this.title,
    required this.icon,
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
            child: Icon(icon, size: 10),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(fontSize: 9),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 25,
              height: 15,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  value > 0 ? '+$value' : '$value',
                  style: const TextStyle(fontSize: 8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
