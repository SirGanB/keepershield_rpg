import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';

class CharacterViewModel extends ChangeNotifier {
  int level = 0;
  final CharacterModel _character;
  List<AbilityScoreModel> atributes = [];
  List<int> saves = [];
  // Map<value, proficiency>
  List<Map<int, int>> skills = [];
  int proficiencyBonus = 0;

  CharacterViewModel({required CharacterModel character})
      : _character = character {
    _setLevel();
    _setProficiencyBonus();
    _setAtributes();
    _setSaves();
    _setSkills();
  }

  String get name => _character.name;
  int get currentHealth => _character.currentHealth;
  int get maxHealth => _character.maxHealth;

  _setLevel() {
    _character.classes.forEach((map) {
      map.forEach((key, value) {
        level += value;
      });
    });
  }

  _setProficiencyBonus() => proficiencyBonus = 2 + ((level - 1) ~/ 4);

  _setAtributes() {
    for (var i = 0; i < 6; i++) {
      atributes.add(AbilityScoreModel(
        isProfiency: _character.saves[i].values.first,
        value: _character.atributes[i].values.first,
      ));
    }
  }

  _setSaves() {
    atributes.forEach((e) {
      saves.add(e.isProfiency ? e.modifier + proficiencyBonus : e.modifier);
    });
  }

  _setSkills() {
    int i = 0;
    int ii = 0;

    _character.skills.forEach((map) {
      if (i == 0) {
        ii = 0;
      } else if (i < 4) {
        ii = 1;
      } else if (i < 9) {
        ii = 3;
      } else if (i < 14) {
        ii = 4;
      } else {
        ii = 5;
      }

      map.forEach((key, proficiency) {
        int value = 0;

        if (proficiency == 0)
          value = atributes[ii].modifier;
        else if (proficiency == 1)
          value = atributes[ii].modifier + proficiencyBonus;
        else
          value = atributes[ii].modifier + (proficiencyBonus * 2);

        skills.add({value: proficiency});
      });

      i++;
    });
  }

  updateSavingThrow() {}
}
