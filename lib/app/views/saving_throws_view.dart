import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_saving_throw_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class SavingThrowsView extends StatefulWidget {
  final CharacterViewModel character;
  const SavingThrowsView({super.key, required this.character});

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
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
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
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    _showEditPopup(
                      ability: 'EXP',
                      text: 'EXEMPLO',
                    );
                  },
                  child: LabelSavingThrowWdgt(
                      title: 'VAR',
                      proficiency: ProficiencyType.nonProficient,
                      value: 0),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }

  void _showEditPopup({required String text, required String ability}) {
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
                      proficiency: ProficiencyType.nonProficient,
                      ability: ability,
                    ),
                    _buildProficiencyBtn(
                      text: 'Sim'.toUpperCase(),
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
    required String ability,
  }) {
    return TextButton(
      onPressed: () {
        //async {
        //widget.character.updateSavingThrow(
        //  ability: ability,
        //  proficiency: proficiency,
        //);

        Navigator.pop(context);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
