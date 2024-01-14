import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/models/dice_model.dart';

class DamageModel {
  final int _qtdDices;
  final DiceModel _dice;
  final DamageType _damageType;

  DamageModel({
    required int qtdDices,
    required DiceModel dice,
    required DamageType damageType,
  })  : _qtdDices = qtdDices,
        _dice = dice,
        _damageType = damageType;

  static String defineAttackType({required AttackType attackType}) {
    String text = '';
    switch (attackType) {
      case AttackType.mWeapon:
        return text = 'Melee Weapon Attack';
      case AttackType.rWeapon:
        return text = 'Ranged Weapon Attack';
      case AttackType.mSpell:
        return text = 'Melee Spell Attack';
      case AttackType.rSpell:
        return text = 'Ranged Spell Attack';
      default:
        'ERROR 404';
    }
    return text;
  }

  @override
  String toString() {
    String string;

    string = '$_qtdDices$_dice ';
    string += '${_damageType.name} ';

    return string;
  }
}

enum DamageType {
  acid,
  bludgeoning,
  cold,
  fire,
  force,
  lightning,
  necrosis,
  piercing,
  poison,
  psychic,
  radiant,
  slashing,
  thunder,
}
