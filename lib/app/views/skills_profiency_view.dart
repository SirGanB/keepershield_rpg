import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_skill_proficiency_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/definitions.dart';
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
                      title: 'Atletismo',
                      proficiency:
                          widget.character.atributes.strength.athletics,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.strength.modifier,
                        proficiency:
                            widget.character.atributes.strength.athletics,
                      ),
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
                      title: 'Acrobacia',
                      proficiency:
                          widget.character.atributes.dexterity.acrobatics,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.dexterity.modifier,
                        proficiency:
                            widget.character.atributes.dexterity.acrobatics,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Furtividade',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Furtividade',
                      proficiency: widget.character.atributes.dexterity.stealth,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.dexterity.modifier,
                        proficiency:
                            widget.character.atributes.dexterity.stealth,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Presitidigitação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Prestidigitação',
                      proficiency:
                          widget.character.atributes.dexterity.sleightOfHands,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.dexterity.modifier,
                        proficiency:
                            widget.character.atributes.dexterity.sleightOfHands,
                      ),
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
                      title: 'Arcanismo',
                      proficiency:
                          widget.character.atributes.intelligence.arcana,
                      value: widget.character.defineProficiencyValue(
                        modifier:
                            widget.character.atributes.intelligence.modifier,
                        proficiency:
                            widget.character.atributes.intelligence.arcana,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'História',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'História',
                      proficiency:
                          widget.character.atributes.intelligence.history,
                      value: widget.character.defineProficiencyValue(
                        modifier:
                            widget.character.atributes.intelligence.modifier,
                        proficiency:
                            widget.character.atributes.intelligence.history,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Investigação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Investigação',
                      proficiency:
                          widget.character.atributes.intelligence.investigation,
                      value: widget.character.defineProficiencyValue(
                        modifier:
                            widget.character.atributes.intelligence.modifier,
                        proficiency: widget
                            .character.atributes.intelligence.investigation,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Natureza',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Natureza',
                      proficiency:
                          widget.character.atributes.intelligence.nature,
                      value: widget.character.defineProficiencyValue(
                        modifier:
                            widget.character.atributes.intelligence.modifier,
                        proficiency:
                            widget.character.atributes.intelligence.nature,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Religião',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Religião',
                      proficiency:
                          widget.character.atributes.intelligence.religion,
                      value: widget.character.defineProficiencyValue(
                        modifier:
                            widget.character.atributes.intelligence.modifier,
                        proficiency:
                            widget.character.atributes.intelligence.religion,
                      ),
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
                      title: 'Intuição',
                      proficiency: widget.character.atributes.wisdom.insight,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.wisdom.modifier,
                        proficiency: widget.character.atributes.wisdom.insight,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Lidar com Animais',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Lidar com Animais',
                      proficiency:
                          widget.character.atributes.wisdom.animalHandling,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.wisdom.modifier,
                        proficiency:
                            widget.character.atributes.wisdom.animalHandling,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Medicina',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Medicina',
                      proficiency: widget.character.atributes.wisdom.medicine,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.wisdom.modifier,
                        proficiency: widget.character.atributes.wisdom.medicine,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Percepção',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Percepção',
                      proficiency: widget.character.atributes.wisdom.perception,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.wisdom.modifier,
                        proficiency:
                            widget.character.atributes.wisdom.perception,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Sobrevivência',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Sobrevivência',
                      proficiency: widget.character.atributes.wisdom.survival,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.wisdom.modifier,
                        proficiency: widget.character.atributes.wisdom.survival,
                      ),
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
                      title: 'Atuação',
                      proficiency:
                          widget.character.atributes.charisma.performance,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.charisma.modifier,
                        proficiency:
                            widget.character.atributes.charisma.performance,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Enganação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Enganação',
                      proficiency:
                          widget.character.atributes.charisma.deception,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.charisma.modifier,
                        proficiency:
                            widget.character.atributes.charisma.deception,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Intimidação',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Intimidação',
                      proficiency:
                          widget.character.atributes.charisma.intimidation,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.charisma.modifier,
                        proficiency:
                            widget.character.atributes.charisma.intimidation,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showPopupSkillEdit(
                        text: 'Persuasão',
                      );
                    },
                    child: SkillProficiencyWdgt(
                      title: 'Persuasão',
                      proficiency:
                          widget.character.atributes.charisma.persuasion,
                      value: widget.character.defineProficiencyValue(
                        modifier: widget.character.atributes.charisma.modifier,
                        proficiency:
                            widget.character.atributes.charisma.persuasion,
                      ),
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
                          proficiency: ProficiencyType.normal,
                        ),
                        _buildProficiencyBtn(
                          text: 'Proficiênte',
                          proficiency: ProficiencyType.proficient,
                        ),
                        _buildProficiencyBtn(
                          text: 'Especialista',
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
    required ProficiencyType proficiency,
  }) {
    return TextButton(
      onPressed: () async {
        print('Proficiência: $proficiency');
        Navigator.pop(context);
      },
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
