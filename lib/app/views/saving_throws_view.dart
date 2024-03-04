import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_saving_throw_wdgt.dart';
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
                    _showEditPopup(
                      ability: character.abilityScores.strength,
                      text: 'Força',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'FOR',
                    proficiency: character.abilityScores.strength.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.strength.modifier,
                      proficiency: character.abilityScores.strength.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: character.abilityScores.dexterity,
                      text: 'Destreza',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'DES',
                    proficiency: character.abilityScores.dexterity.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.dexterity.modifier,
                      proficiency:
                          character.abilityScores.dexterity.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: character.abilityScores.constitution,
                      text: 'Constituição',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'CON',
                    proficiency:
                        character.abilityScores.constitution.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.constitution.modifier,
                      proficiency:
                          character.abilityScores.constitution.proficiency,
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
                    _showEditPopup(
                      ability: character.abilityScores.intelligence,
                      text: 'Inteligência',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'INT',
                    proficiency:
                        character.abilityScores.intelligence.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.intelligence.modifier,
                      proficiency:
                          character.abilityScores.intelligence.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: character.abilityScores.wisdom,
                      text: 'Sabedoria',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'SAB',
                    proficiency: character.abilityScores.wisdom.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.wisdom.modifier,
                      proficiency: character.abilityScores.wisdom.proficiency,
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: character.abilityScores.charisma,
                      text: 'Carisma',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                    title: 'CAR',
                    proficiency: character.abilityScores.charisma.proficiency,
                    value: character.defineProficiencyValue(
                      modifier: character.abilityScores.charisma.modifier,
                      proficiency: character.abilityScores.charisma.proficiency,
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

  void _showEditPopup({required String text, required AbilityModel ability}) {
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
                      text: 'Não'.toUpperCase(),
                      proficiency: ProficiencyType.NonProficient,
                      ability: ability,
                    ),
                    _buildProficiencyBtn(
                      text: 'Sim'.toUpperCase(),
                      proficiency: ProficiencyType.Proficient,
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
