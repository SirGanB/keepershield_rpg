import 'package:flutter/material.dart';

class LabelAbilityScores extends StatelessWidget {
  final String title;
  final int modifier;
  final int score;
  const LabelAbilityScores({
    super.key,
    required this.title,
    required this.modifier,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            // Main Square
            Container(
              padding: const EdgeInsets.only(top: 5),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  modifier > 0 ? '+$modifier' : '$modifier',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),

            // Title
            SizedBox(
              width: 100,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline, width: 2),
                  ),
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ),
            ),

            //Bottom Retangle
            SizedBox(
              height: 110,
              width: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 30,
                  width: 40,
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
                      '$score',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
