import 'package:flutter/material.dart';
import 'package:rpg_keeper_hub/components/character_sheet_comp/comp_label_ability_scores.dart';
import 'package:rpg_keeper_hub/components/character_sheet_comp/comp_label_armory.dart';
import 'package:rpg_keeper_hub/components/character_sheet_comp/comp_label_save_throw.dart';
import 'package:rpg_keeper_hub/models/Weapon.dart';
import 'package:rpg_keeper_hub/models/character.dart';
import 'package:rpg_keeper_hub/models/damage.dart';
import 'package:rpg_keeper_hub/models/definitions.dart';
import 'package:rpg_keeper_hub/models/dice.dart';

class CharacterSheetView extends StatefulWidget {
  final Character character;

  const CharacterSheetView({super.key, required this.character});

  @override
  State<CharacterSheetView> createState() => _CharacterSheetViewState();
}

class _CharacterSheetViewState extends State<CharacterSheetView> {
  AppBar appBar = AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Colors.grey[900],
    centerTitle: true,
    title: const Text(
      'Character Sheet',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Weapon> collArmory = [
      Weapon(
          name: 'Long Bow',
          attackType: AttackType.rWeapon,
          reach: 500,
          damages: [
            Damage(
              qtdDices: 1,
              dice: Dice(sides: 8),
              damageType: DamageType.piercing,
            ),
          ]),
      Weapon(
          name: 'Large Sword of Cold',
          attackType: AttackType.mWeapon,
          reach: 5,
          damages: [
            Damage(
              qtdDices: 2,
              dice: Dice(sides: 6),
              damageType: DamageType.slashing,
            ),
            Damage(
              qtdDices: 1,
              dice: Dice(sides: 6),
              damageType: DamageType.cold,
            ),
          ]),
      Weapon(
          name: 'Short Sword of Fire',
          attackType: AttackType.mWeapon,
          reach: 5,
          damages: [
            Damage(
              qtdDices: 1,
              dice: Dice(sides: 6),
              damageType: DamageType.slashing,
            ),
            Damage(
              qtdDices: 1,
              dice: Dice(sides: 6),
              damageType: DamageType.fire,
            ),
          ]),
    ];

    return Scaffold(
      appBar: appBar,
      body: Container(
        alignment: Alignment.topRight,
        color: Colors.grey[700],
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          SizedBox(
            width: screenSize.width,
            child: Text(
              widget.character.name.toUpperCase(),
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color.fromARGB(255, 90, 13, 8),
                fontSize: screenSize.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            child: const Text(
              'Medium Humanoid, Lawful Good',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Text(
            'Classe: ${widget.character.classes}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Raça: ${widget.character.race}',
            style: const TextStyle(fontSize: 16),
          ),
          const CompLabelAbilityScore(),
          const CompLabelSaveTrow(),
          CompLabelArmory(collArmory: collArmory),
        ]),
      ),
    );
  }
}
