import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/definitions.dart';

class LabelWeaponWdgt extends StatelessWidget {
  final String weapon;
  final int attack;
  final int damage;
  final ProficiencyType proficiency;
  final bool isEquiped;

  const LabelWeaponWdgt({super.key, 
    required this.weapon,
    required this.attack,
    required this.damage,
    required this.proficiency,
    this.isEquiped = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Stack(
        children: [
          Card(
            child: Container(
              decoration: isEquiped ? buildBoxDecoration() : null,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildValueLabel(
                        context,
                        text: 'Ataque',
                        value: attack > 0 ? '+$attack' : '$attack',
                      ),
                      Expanded(
                        child: Container(
                          child: _buildValueLabel(
                            context,
                            text: 'Arma',
                            value: weapon,
                          ),
                        ),
                      ),
                      _buildValueLabel(context, text: 'Dano', value: '$damage'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isEquiped ? _buildHelperText(context) : SizedBox(),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.amber,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildHelperText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Container(
          height: 12,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            constraints: BoxConstraints(maxWidth: 40),
            child: Center(
              child: Text(
                'Equipado'.toUpperCase(),
                style: TextStyle(
                  fontSize: 6,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValueLabel(
    BuildContext context, {
    required String text,
    required String value,
  }) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: proficiency == ProficiencyType.proficient
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
