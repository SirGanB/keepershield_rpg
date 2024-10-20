import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_skill_proficiency_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class SkillsProficencyView extends StatefulWidget {
  final CharacterViewModel character;
  const SkillsProficencyView({super.key, required this.character});

  @override
  State<SkillsProficencyView> createState() => _SkillsProficencyViewState();
}

class _SkillsProficencyViewState extends State<SkillsProficencyView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context, character, w) {
        return Column(
          children: [
            const CustomDividerWdgt(title: 'Perícias'),
            Container(
              height: 450,
              margin: EdgeInsets.only(bottom: 25),
              child: Row(children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitleProficiency(title: 'Força'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      _buildTitleProficiency(title: 'Destreza'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      _buildTitleProficiency(title: 'Inteligência'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 8,
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
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      _buildTitleProficiency(title: 'Carisma'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.nonProficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.nonProficient,
                          value: 0
                        ),
                      ),
                     GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.proficient,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.proficient,
                          value: 0
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'edit_skill',
                            skill: ProficiencyType.expert,
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'skill',
                          proficiency: ProficiencyType.expert,
                          value: 0
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitleProficiency({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _showPopupSkillEdit({required String text, required ProficiencyType skill}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Qual a proficiência de ${widget.character.name} em $text?',
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
                          text: 'Inapto',
                          skill: skill,
                          proficiency: ProficiencyType.nonProficient,
                        ),
                        _buildProficiencyBtn(
                          text: 'Proficiênte',
                          skill: skill,
                          proficiency: ProficiencyType.proficient,
                        ),
                        _buildProficiencyBtn(
                          text: 'Especialista',
                          skill: skill,
                          proficiency: ProficiencyType.expert,
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
    required ProficiencyType skill,
    required ProficiencyType proficiency,
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