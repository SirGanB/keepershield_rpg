import 'package:flutter/material.dart';

class CompCharacterPortrait extends StatelessWidget {
  const CompCharacterPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      margin: const EdgeInsets.fromLTRB(0, 5, 8, 5),
      height: 150,
      width: 150,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: 25,
          width: 150,
          color: const Color.fromARGB(150, 0, 0, 0),
          child: Center(
            child: Text(
              'Mallaggor Skashraii'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ),
        const Icon(
          Icons.account_circle,
          size: 65,
        ),
        Center(
          child: Container(
            height: 25,
            width: 150,
            color: const Color.fromARGB(150, 0, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textStats(
                    text: '666/999',
                    icon: Icons.heart_broken,
                    iconColor: Colors.red,
                  ),
                  textStats(
                    text: '17',
                    icon: Icons.shield,
                    iconColor: Colors.grey,
                  ),
                  textStats(
                    text: '12',
                    icon: Icons.remove_red_eye,
                    iconColor: Colors.purple,
                  ),
                ]),
          ),
        ),
      ]),
    );
  }

  Row textStats(
      {required String text, required IconData icon, Color? iconColor}) {
    return Row(children: [
      Icon(
        icon,
        color: iconColor ?? Colors.white,
        size: 15,
      ),
      const SizedBox(width: 3),
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    ]);
  }
}
