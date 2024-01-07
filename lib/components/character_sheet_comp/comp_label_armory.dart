import 'package:flutter/material.dart';
import '../../models/Weapon.dart';

class CompLabelArmory extends StatelessWidget {
  final List<Weapon> collArmory;
  const CompLabelArmory({Key? key, required this.collArmory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      _header(),
      Text(_keepArmory(collArmory)),
    ]);
  }
}

Widget _header() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        'Armory',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 24,
          color: Color.fromARGB(255, 90, 13, 8),
          fontWeight: FontWeight.bold,
        ),
      ),
      _btnAddWeapon(),
    ]),
    const Divider(thickness: 2, color: Color.fromARGB(255, 90, 13, 8)),
  ]);
}

TextButton _btnAddWeapon() {
  return TextButton(
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white54),
      overlayColor: MaterialStatePropertyAll(Color.fromARGB(80, 185, 45, 45)),
    ),
    onPressed: () {},
    child: const Icon(
      Icons.add,
      color: Color.fromARGB(255, 90, 13, 8),
    ),
  );
}

String _keepArmory(List<Weapon> collection) {
  String armory = '';
  for (var e in collection) {
    armory += '$e\n';
  }
  return armory;
}
