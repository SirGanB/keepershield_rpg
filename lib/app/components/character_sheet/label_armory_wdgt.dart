import 'package:flutter/material.dart';
import 'package:keepershield_rpg/model/lib_model.dart';

class LabelArmoryWdgt extends StatelessWidget {
  final List<Weapon> collArmory;
  const LabelArmoryWdgt({Key? key, required this.collArmory}) : super(key: key);

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
          fontWeight: FontWeight.bold,
        ),
      ),
      _btnAddWeapon(),
    ]),
    const Divider(thickness: 2),
  ]);
}

TextButton _btnAddWeapon() {
  return TextButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  );
}

String _keepArmory(List<Weapon> collection) {
  String armory = '';
  for (var e in collection) {
    armory += '$e\n';
  }
  return armory;
}
