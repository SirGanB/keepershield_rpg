import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/saving_throw_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';

class SavingThrowsView extends StatefulWidget {
  final CharacterViewModel character;

  const SavingThrowsView({super.key, required this.character});

  @override
  State<SavingThrowsView> createState() => _SavingThrowsViewState();
}

class _SavingThrowsViewState extends State<SavingThrowsView> {
  @override
  Widget build(BuildContext context) {
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
                  text: 'Força',
                  savingThrow: widget.character.saves[0],
                );
              },
              child: LabelSavingThrowWdgt(
                title: 'FOR',
                isProficient: widget.character.atributes[0].isProfiency,
                value: widget.character.saves[0],
              ),
            ),
            LabelSavingThrowWdgt(
              title: 'DES',
              isProficient: widget.character.atributes[1].isProfiency,
              value: widget.character.saves[1],
            ),
            LabelSavingThrowWdgt(
              title: 'CON',
              isProficient: widget.character.atributes[2].isProfiency,
              value: widget.character.saves[2],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LabelSavingThrowWdgt(
              title: 'INT',
              isProficient: widget.character.atributes[3].isProfiency,
              value: widget.character.saves[3],
            ),
            LabelSavingThrowWdgt(
              title: 'WIS',
              isProficient: widget.character.atributes[4].isProfiency,
              value: widget.character.saves[4],
            ),
            LabelSavingThrowWdgt(
              title: 'CHA',
              isProficient: widget.character.atributes[5].isProfiency,
              value: widget.character.saves[5],
            ),
          ],
        ),
      ),
    ]);
  }

  void _showPopupSavingThrowEdit({
    required String text,
    required int savingThrow,
  }) {
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
                    'Qual o tipo de proficiência do personagem na salvaguarda de $text?'
                        .toUpperCase(),
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
                      savingThrow: savingThrow,
                    ),
                    _buildProficiencyBtn(
                      text: 'Proficiênte',
                      savingThrow: savingThrow,
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
    required int savingThrow,
  }) {
    return TextButton(
      onPressed: () async {
        //Update Proficiency

        Navigator.pop(context);
      },
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
