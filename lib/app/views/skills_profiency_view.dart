import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_skill_proficiency_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/definitions.dart';
import 'package:keepershield_rpg/models/skill_model.dart';
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
                            text: 'Atletismo',
                            skill: Athletics(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Atletismo',
                          proficiency: widget.character.abilityScores.strength
                              .athletics.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.strength.modifier,
                            proficiency: widget.character.abilityScores.strength
                                .athletics.proficiency,
                          ),
                        ),
                      ),
                      _buildTitleProficiency(title: 'Destreza'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                              text: 'Acrobacia', skill: Acrobatics());
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Acrobacia',
                          proficiency: widget.character.abilityScores.dexterity
                              .acrobatics.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.dexterity.modifier,
                            proficiency: widget.character.abilityScores
                                .dexterity.acrobatics.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Furtividade',
                            skill: Stealth(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Furtividade',
                          proficiency: widget.character.abilityScores.dexterity
                              .stealth.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.dexterity.modifier,
                            proficiency: widget.character.abilityScores
                                .dexterity.stealth.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Presitidigitação',
                            skill: SleightOfHand(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Prestidigitação',
                          proficiency: widget.character.abilityScores.dexterity
                              .sleightOfHand.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.dexterity.modifier,
                            proficiency: widget.character.abilityScores
                                .dexterity.sleightOfHand.proficiency,
                          ),
                        ),
                      ),
                      _buildTitleProficiency(title: 'Inteligência'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Arcanismo',
                            skill: Arcana(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Arcanismo',
                          proficiency: widget.character.abilityScores
                              .intelligence.arcana.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.intelligence.modifier,
                            proficiency: widget.character.abilityScores
                                .intelligence.arcana.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'História',
                            skill: History(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'História',
                          proficiency: widget.character.abilityScores
                              .intelligence.history.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.intelligence.modifier,
                            proficiency: widget.character.abilityScores
                                .intelligence.history.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Investigação',
                            skill: Investigation(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Investigação',
                          proficiency: widget.character.abilityScores
                              .intelligence.investigation.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.intelligence.modifier,
                            proficiency: widget.character.abilityScores
                                .intelligence.investigation.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Natureza',
                            skill: Nature(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Natureza',
                          proficiency: widget.character.abilityScores
                              .intelligence.nature.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.intelligence.modifier,
                            proficiency: widget.character.abilityScores
                                .intelligence.nature.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Religião',
                            skill: Religion(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Religião',
                          proficiency: widget.character.abilityScores
                              .intelligence.religion.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.intelligence.modifier,
                            proficiency: widget.character.abilityScores
                                .intelligence.religion.proficiency,
                          ),
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
                            text: 'Intuição',
                            skill: Insight(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Intuição',
                          proficiency: widget.character.abilityScores.wisdom
                              .insight.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier:
                                widget.character.abilityScores.wisdom.modifier,
                            proficiency: widget.character.abilityScores.wisdom
                                .insight.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Adestrar Animais',
                            skill: AnimalHandling(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Adestrar Animais',
                          proficiency: widget.character.abilityScores.wisdom
                              .animalHandling.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier:
                                widget.character.abilityScores.wisdom.modifier,
                            proficiency: widget.character.abilityScores.wisdom
                                .animalHandling.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Medicina',
                            skill: Medicine(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Medicina',
                          proficiency: widget.character.abilityScores.wisdom
                              .medicine.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier:
                                widget.character.abilityScores.wisdom.modifier,
                            proficiency: widget.character.abilityScores.wisdom
                                .medicine.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Percepção',
                            skill: Perception(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Percepção',
                          proficiency: widget.character.abilityScores.wisdom
                              .perception.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier:
                                widget.character.abilityScores.wisdom.modifier,
                            proficiency: widget.character.abilityScores.wisdom
                                .perception.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Sobrevivência',
                            skill: Survival(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Sobrevivência',
                          proficiency: widget.character.abilityScores.wisdom
                              .survival.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier:
                                widget.character.abilityScores.wisdom.modifier,
                            proficiency: widget.character.abilityScores.wisdom
                                .survival.proficiency,
                          ),
                        ),
                      ),
                      _buildTitleProficiency(title: 'Carisma'),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Atuação',
                            skill: Performance(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Atuação',
                          proficiency: widget.character.abilityScores.charisma
                              .performance.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.charisma.modifier,
                            proficiency: widget.character.abilityScores.charisma
                                .performance.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Enganação',
                            skill: Deception(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Enganação',
                          proficiency: widget.character.abilityScores.charisma
                              .deception.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.charisma.modifier,
                            proficiency: widget.character.abilityScores.charisma
                                .deception.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Intimidação',
                            skill: Intimidation(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Intimidação',
                          proficiency: widget.character.abilityScores.charisma
                              .intimidation.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.charisma.modifier,
                            proficiency: widget.character.abilityScores.charisma
                                .intimidation.proficiency,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupSkillEdit(
                            text: 'Persuasão',
                            skill: Persuasion(),
                          );
                        },
                        child: SkillProficiencyWdgt(
                          title: 'Persuasão',
                          proficiency: widget.character.abilityScores.charisma
                              .persuasion.proficiency,
                          value: widget.character.defineProficiencyValue(
                            modifier: widget
                                .character.abilityScores.charisma.modifier,
                            proficiency: widget.character.abilityScores.charisma
                                .persuasion.proficiency,
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

  void _showPopupSkillEdit({required String text, required SkillModel skill}) {
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
                          proficiency: ProficiencyType.NonProficient,
                        ),
                        _buildProficiencyBtn(
                          text: 'Proficiênte',
                          skill: skill,
                          proficiency: ProficiencyType.Proficient,
                        ),
                        _buildProficiencyBtn(
                          text: 'Especialista',
                          skill: skill,
                          proficiency: ProficiencyType.Expert,
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
    required SkillModel skill,
    required ProficiencyType proficiency,
  }) {
    return TextButton(
      onPressed: () async {
        widget.character.updateSkill(skill: skill, proficiency: proficiency);
        Navigator.pop(context);
      },
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 8),
      ),
    );
  }
}
