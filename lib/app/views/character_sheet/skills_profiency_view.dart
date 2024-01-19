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
                        skill: 'Athletics',
                        text: 'Atletismo',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.athleticsProficiency,
                      title: 'Atletismo',
                      value: widget.character.athletics,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Destreza'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Acrobatics',
                        text: 'Acrobacia',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.acrobaticsProficiency,
                      title: 'Acrobacia',
                      value: widget.character.acrobatics,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Stealth',
                        text: 'Furtividade',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.stealthProficiency,
                      title: 'Furtividade',
                      value: widget.character.stealth,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Sleight of Hand',
                        text: 'Presitidigitação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.sleightOfHandProficiency,
                      title: 'Prestidigitação',
                      value: widget.character.sleightOfHand,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Inteligência'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Arcana',
                        text: 'Arcanismo',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.arcanaProficiency,
                      title: 'Arcanismo',
                      value: widget.character.arcana,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'History',
                        text: 'História',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.historyProficiency,
                      title: 'História',
                      value: widget.character.history,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Investigation',
                        text: 'Investigação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.investigationProficiency,
                      title: 'Investigação',
                      value: widget.character.investigation,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Nature',
                        text: 'Natureza',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.natureProficiency,
                      title: 'Natureza',
                      value: widget.character.nature,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Religion',
                        text: 'Religião',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.religionProficiency,
                      title: 'Religião',
                      value: widget.character.religion,
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
                        skill: 'Insight',
                        text: 'Intuição',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.insightProficiency,
                      title: 'Intuição',
                      value: widget.character.insight,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Animal Handling',
                        text: 'Lidar com Animais',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.animalHandlingProficiency,
                      title: 'Lidar com Animais',
                      value: widget.character.animalHandling,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Medicine',
                        text: 'Medicina',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.medicineProficiency,
                      title: 'Medicina',
                      value: widget.character.medicine,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Perception',
                        text: 'Percepção',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.perceptionProficiency,
                      title: 'Percepção',
                      value: widget.character.perception,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Survival',
                        text: 'Sobrevivência',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.survivalProficiency,
                      title: 'Sobrevivência',
                      value: widget.character.survival,
                    ),
                  ),
                  _buildTitleProficiency(title: 'Carisma'),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Performance',
                        text: 'Atuação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.performanceProficiency,
                      title: 'Atuação',
                      value: widget.character.performance,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Deception',
                        text: 'Enganação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.deceptionProficiency,
                      title: 'Enganação',
                      value: widget.character.deception,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Intimidation',
                        text: 'Intimidação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.intimidationProficiency,
                      title: 'Intimidação',
                      value: widget.character.intimidation,
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        skill: 'Persuasion',
                        text: 'Persuasão',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      proficiency: widget.character.persuasionProficiency,
                      title: 'Persuasão',
                      value: widget.character.persuasion,
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

  void _showPopupSkillEdit({required String skill, required String text}) {
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
                          skill: skill,
                          value: 0,
                        ),
                        _buildProficiencyBtn(
                          text: 'Proficiênte',
                          skill: skill,
                          value: 1,
                        ),
                        _buildProficiencyBtn(
                          text: 'Especialista',
                          skill: skill,
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
    required String skill,
    required int value,
  }) {
    return TextButton(
      onPressed: () async {
        widget.character.updateSkill(
          context: context,
          skill: skill,
          value: value,
        );

        Navigator.pop(context);
      },
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
