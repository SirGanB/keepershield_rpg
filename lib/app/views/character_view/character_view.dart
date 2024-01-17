import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_ability_scores_wdgt.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_saving_throw_wdgt.dart';
import 'package:keepershield_rpg/app/components/character_sheet/proficiency_score_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';

class CharacterView extends StatefulWidget {
  final CharacterViewModel character;

  const CharacterView({super.key, required this.character});
  @override
  _CharacterViewState createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed Label
          _buildCharacterProfile(context),

          // Scrollable Label
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_screenIndex == 0) _buildAtributeLabel(),
                  if (_screenIndex == 1) const Text('View 2'),
                  if (_screenIndex == 2) const Text('View 3'),
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: (index) {
          setState(() {
            _screenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Atributos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Coming Soon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Coming Soon',
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterProfile(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 200,
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildProperty(
                      icon: Icons.favorite,
                      title: 'Pontos\nde Vida',
                      text: '15',
                    ),
                    _buildProperty(
                      icon: Icons.shield,
                      title: 'Classe de Armadura',
                      text: '${widget.character.dexteryModifier + 10}',
                    ),
                    _buildProperty(
                      icon: Icons.remove_red_eye,
                      title: 'Percepção Passiva',
                      text: '12',
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 3,
                        ),
                      ),
                      child: const Icon(Icons.question_mark, size: 50),
                    ),
                  ),
                  //Text(widget.character),
                ],
              ),
              SizedBox(
                height: 200,
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildProperty(
                      icon: Icons.transfer_within_a_station,
                      title: 'Velocidade de Movimento',
                      text: '9m',
                    ),
                    _buildProperty(
                        icon: Icons.sports_martial_arts,
                        title: 'Bônus de Proficiência',
                        text: '+${widget.character.proficiencyBonus}'),
                    _buildProperty(
                      icon: Icons.sports_kabaddi,
                      title: 'Bônus de Iniciativa',
                      text: '+2',
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildTitleBar(context),
        ],
      ),
    );
  }

  Widget _buildProperty({
    required String title,
    required String text,
    required IconData icon,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(icon, size: 18),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 80,
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        )
      ],
    );
  }

  Container _buildTitleBar(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.character.name.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  wordSpacing: 5,
                  letterSpacing: 3,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildAtributeLabel() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Ability Scores
          const CustomDividerWdgt(title: 'Valores de Atributos'),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LabelAbilityScores(
                  title: 'Força',
                  modifier: widget.character.strengthModifier,
                  score: widget.character.strength,
                ),
                LabelAbilityScores(
                  title: 'Destreza',
                  modifier: widget.character.dexteryModifier,
                  score: widget.character.dextery,
                ),
                LabelAbilityScores(
                  title: 'Constituição',
                  modifier: widget.character.constitutionModifier,
                  score: widget.character.constitution,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LabelAbilityScores(
                title: 'Inteligência',
                modifier: widget.character.intelligenceModifier,
                score: widget.character.intelligence,
              ),
              LabelAbilityScores(
                title: 'Sabedoria',
                modifier: widget.character.wisdomModifier,
                score: widget.character.wisdom,
              ),
              LabelAbilityScores(
                title: 'Carisma',
                modifier: widget.character.charismaModifier,
                score: widget.character.charisma,
              ),
            ],
          ),

          // Saving Throws
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

          const CustomDividerWdgt(title: 'Perícias'),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitleProficiency(title: 'Força'),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Atletismo',
                      value: widget.character.strengthModifier,
                    ),
                    _buildTitleProficiency(title: 'Destreza'),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Acrobacia',
                      value: widget.character.dexteryModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle,
                      title: 'Furtividade',
                      value: widget.character.dexteryModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.star,
                      title: 'Prestidigitação',
                      value: widget.character.dexteryModifier,
                    ),
                    _buildTitleProficiency(title: 'Inteligência'),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Arcanismo',
                      value: widget.character.intelligenceModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'História',
                      value: widget.character.intelligenceModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Investigação',
                      value: widget.character.intelligenceModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Natureza',
                      value: widget.character.intelligenceModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Religião',
                      value: widget.character.intelligenceModifier,
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
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Intuição',
                      value: widget.character.wisdomModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Lidar com Animais',
                      value: widget.character.wisdomModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Medicina',
                      value: widget.character.wisdomModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Percepção',
                      value: widget.character.wisdomModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Sobrevivência',
                      value: widget.character.wisdomModifier,
                    ),
                    _buildTitleProficiency(title: 'Carisma'),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Religião',
                      value: widget.character.charismaModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Religião',
                      value: widget.character.charismaModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Religião',
                      value: widget.character.charismaModifier,
                    ),
                    ProficiencyScoreWdgt(
                      icon: Icons.circle_outlined,
                      title: 'Religião',
                      value: widget.character.charismaModifier,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
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
}
