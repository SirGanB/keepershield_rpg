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
            LabelSavingThrowWdgt(
              title: 'FOR',
              isProficient: widget.character.stStr,
              value: widget.character.strengthSavingThrow,
            ),
            LabelSavingThrowWdgt(
              title: 'DES',
              isProficient: widget.character.stDex,
              value: widget.character.dexterySavingThrow,
            ),
            LabelSavingThrowWdgt(
              title: 'CON',
              isProficient: widget.character.stCon,
              value: widget.character.constitutionSavingThrow,
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
              isProficient: widget.character.stInt,
              value: widget.character.intelligenceSavingThrow,
            ),
            LabelSavingThrowWdgt(
              title: 'WIS',
              isProficient: widget.character.stWis,
              value: widget.character.wisdomSavingThrow,
            ),
            LabelSavingThrowWdgt(
              title: 'CHA',
              isProficient: widget.character.stCha,
              value: widget.character.charismaSavingThrow,
            ),
          ],
        ),
      ),
    ]);
  }
}
