import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_weapon_wdgt.dart';
import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class CharacterArmoryView extends StatelessWidget {
  const CharacterArmoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(builder: (context, character, w) {
      return Column(
        children: [
          _buildUsingLabel(context),
          CustomDividerWdgt(
            title: 'Armas',
            onPressed: () => print('ADD WEAPON'),
          ),
          LabelWeaponWdgt(
            weapon: 'Espada Grande',
            proficiency: ProficiencyType.proficient,
            attack: 2,
            damage: 5,
          ),
          LabelWeaponWdgt(
            weapon: 'Espada Grande',
            proficiency: ProficiencyType.proficient,
            attack: 2,
            damage: 5,
          ),
          LabelWeaponWdgt(
            weapon: 'Espada Grande',
            proficiency: ProficiencyType.proficient,
            attack: 2,
            damage: 5,
          ),
          LabelWeaponWdgt(
            weapon: 'Arco Longo',
            proficiency: ProficiencyType.proficient,
            attack: 7,
            damage: 6,
            isEquiped: true,
          ),
          LabelWeaponWdgt(
            weapon: 'Tridente',
            proficiency: ProficiencyType.nonProficient,
            attack: -1,
            damage: 3,
          ),
          CustomDividerWdgt(
            title: 'Armaduras',
            onPressed: () => print('ADD ARMOR'),
          ),
          CustomDividerWdgt(
            title: 'Itens',
            onPressed: () => print('ADD ITEN'),
          ),
        ],
      );
    });
  }

  Widget _buildUsingLabel(
    BuildContext context,
  ) {
    double size = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomDividerWdgt(title: 'Equipados'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: size / 2),
              child: CustomTextLabelWdgt(
                title: 'Mão Principal',
                text: 'Arco Longo',
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: size / 2),
              child: CustomTextLabelWdgt(
                title: 'Mão Secundária',
                text: 'Arco Longo',
              ),
            ),
          ],
        ),
        CustomTextLabelWdgt(
          title: 'Armadura',
          text: 'Armadura de Talas',
        ),
      ],
    );
  }
}
