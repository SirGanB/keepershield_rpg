import 'package:flutter/material.dart';

class CompCharacterPortrait extends StatelessWidget {
  const CompCharacterPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
      color: Colors.black,
      height: 150,
      width: 150,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'Mallaggor Skashraii'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 80,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          lifeStats(),
          armorStats(),
        ]),
      ]),
    );
  }

  Row lifeStats() {
    return const Row(children: [
      Icon(
        Icons.heart_broken,
        color: Colors.red,
        size: 15,
      ),
      SizedBox(width: 3),
      Text(
        '666/999',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    ]);
  }

  Row armorStats() {
    return const Row(children: [
      Icon(
        Icons.shield,
        color: Colors.grey,
        size: 15,
      ),
      SizedBox(width: 3),
      Text(
        '17',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    ]);
  }
}
