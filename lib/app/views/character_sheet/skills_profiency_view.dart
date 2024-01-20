import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_skill_proficiency_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';

class SkillsProficencyView extends StatefulWidget {
  final CharacterViewModel character;
  const SkillsProficencyView({super.key, required this.character});

  @override
  State<SkillsProficencyView> createState() => _SkillsProficencyViewState();
}

class _SkillsProficencyViewState extends State<SkillsProficencyView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDividerWdgt(title: 'Perícias'),
        SizedBox(
          height: 415,
          child: Row(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitleProficiency(title: 'Força'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Atletismo',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[0].values.first,
                      title: 'Atletismo',
                      value: widget.character.skills[0].keys.first,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Destreza'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Acrobacia',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[1].values.first,
                      title: 'Acrobacia',
                      value: widget.character.skills[1].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Furtividade',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[2].values.first,
                      title: 'Furtividade',
                      value: widget.character.skills[2].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Presitidigitação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[3].values.first,
                      title: 'Prestidigitação',
                      value: widget.character.skills[3].keys.first,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Inteligência'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Arcanismo',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[4].values.first,
                      title: 'Arcanismo',
                      value: widget.character.skills[4].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'História',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[5].values.first,
                      title: 'História',
                      value: widget.character.skills[5].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Investigação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[6].values.first,
                      title: 'Investigação',
                      value: widget.character.skills[6].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Natureza',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[7].values.first,
                      title: 'Natureza',
                      value: widget.character.skills[7].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Religião',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[8].values.first,
                      title: 'Religião',
                      value: widget.character.skills[8].keys.first,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              thickness: 2,
              width: 2,
              color: Theme.of(context).colorScheme.outline,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitleProficiency(title: 'Sabedoria'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Intuição',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[9].values.first,
                      title: 'Intuição',
                      value: widget.character.skills[9].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Lidar com Animais',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[10].values.first,
                      title: 'Lidar com Animais',
                      value: widget.character.skills[10].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Medicina',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[11].values.first,
                      title: 'Medicina',
                      value: widget.character.skills[11].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Percepção',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[12].values.first,
                      title: 'Percepção',
                      value: widget.character.skills[12].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Sobrevivência',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[13].values.first,
                      title: 'Sobrevivência',
                      value: widget.character.skills[13].keys.first,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Carisma'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Atuação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[14].values.first,
                      title: 'Atuação',
                      value: widget.character.skills[14].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Enganação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[15].values.first,
                      title: 'Enganação',
                      value: widget.character.skills[15].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Intimidação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[16].values.first,
                      title: 'Intimidação',
                      value: widget.character.skills[16].keys.first,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Persuasão',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.skills[17].values.first,
                      title: 'Persuasão',
                      value: widget.character.skills[17].keys.first,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildTitleProficiency({required String title}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )),
          ),
        ),
        _buildProfiencyDivider(),
      ],
    );
  }

  Widget _buildProfiencyDivider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
      child: Divider(
        height: 2,
        thickness: 1.5,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }

  void _showPopupSkillEdit({required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Qual a proficiência do personagem em $text?'
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
                          value: widget.character.skills[0].keys.first,
                        ),
                        _buildProficiencyBtn(
                          text: 'Proficiênte',
                          value: 1,
                        ),
                        _buildProficiencyBtn(
                          text: 'Especialista',
                          value: 2,
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  TextButton _buildProficiencyBtn({
    required String text,
    required int value,
  }) {
    return TextButton(
      onPressed: () async {
        Navigator.pop(context);
      },
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
