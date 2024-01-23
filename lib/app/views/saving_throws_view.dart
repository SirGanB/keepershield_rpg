import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/saving_throw_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/ability_model.dart';
import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class SavingThrowsView extends StatefulWidget {
  final CharacterViewModel character;
  const SavingThrowsView({required this.character});

  @override
  State<SavingThrowsView> createState() => _SavingThrowsViewState();
}

class _SavingThrowsViewState extends State<SavingThrowsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context, character, child) {
        return Column(children: [
          const CustomDividerWdgt(title: 'Salvaguardas'),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.strength,
                      text: 'Força',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'FOR',
                    proficiency: character.atributes.strength.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.strength.modifier,
                      proficiency: character.atributes.strength.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.dexterity,
                      text: 'Destreza',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'DES',
                    proficiency: character.atributes.dexterity.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.dexterity.modifier,
                      proficiency: character.atributes.dexterity.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.constitution,
                      text: 'Constituição',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'CON',
                    proficiency: character.atributes.constitution.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.constitution.modifier,
                      proficiency: character.atributes.constitution.proficiency,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.intelligence,
                      text: 'Inteligência',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'INT',
                    proficiency: character.atributes.intelligence.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.intelligence.modifier,
                      proficiency: character.atributes.intelligence.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.wisdom,
                      text: 'Sabedoria',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'SAB',
                    proficiency: character.atributes.wisdom.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.wisdom.modifier,
                      proficiency: character.atributes.wisdom.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showPopupSavingThrowEdit(
                      ability: character.atributes.charisma,
                      text: 'Carisma',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'CAR',
                    proficiency: character.atributes.charisma.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.atributes.charisma.modifier,
                      proficiency: character.atributes.charisma.proficiency,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }

  void _showPopupSavingThrowEdit(
      {required String text, required AbilityModel ability}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    '${widget.character.name} possui proficiência em ${text.toUpperCase()}?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildProficiencyBtn(
                      text: 'Normal',
                      proficiency: ProficiencyType.normal,
                      ability: ability,
                    ),
                    _buildProficiencyBtn(
                      text: 'Proficiênte',
                      proficiency: ProficiencyType.proficient,
                      ability: ability,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextButton _buildProficiencyBtn({
    required String text,
    required ProficiencyType proficiency,
    required AbilityModel ability,
  }) {
    return TextButton(
      onPressed: () async {
        widget.character.updateSavingThrow(
          ability: ability,
          proficiency: proficiency,
        );

        Navigator.pop(context);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
