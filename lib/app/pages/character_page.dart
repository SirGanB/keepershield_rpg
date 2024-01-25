import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/views/ability_scores_view.dart';
import 'package:keepershield_rpg/app/views/saving_throws_view.dart';
import 'package:keepershield_rpg/app/views/skills_profiency_view.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class CharacterPage extends StatefulWidget {
  final CharacterViewModel character;

  const CharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.character,
      child: Scaffold(
        body: Column(
          children: [
            _buildCharacterProfile(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (_screenIndex == 0) _buildAttributeLabel(),
                      if (_screenIndex == 1) const Text('View 2'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _screenIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.outline,
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
          ],
        ),
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
                      title: 'Pontos de Vida',
                      text:
                          '${widget.character.currentHealth}/${widget.character.maxHealth}',
                    ),
                    _buildProperty(
                      icon: Icons.shield,
                      title: 'Classe de Armadura',
                      text: '${widget.character.defineArmorClass()}',
                    ),
                    _buildProperty(
                      icon: Icons.remove_red_eye,
                      title: 'Percepção Passiva',
                      text: '${widget.character.definePassivePerception()}',
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
                      text: '+${widget.character.proficiencyBonus}',
                    ),
                    _buildProperty(
                      icon: Icons.sports_kabaddi,
                      title: 'Bônus de Iniciativa',
                      text:
                          '+${widget.character.abilityScores.dexterity.modifier}',
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
      ),
    );
  }

  Widget _buildAttributeLabel() {
    return SingleChildScrollView(
      child: Column(
        children: [
          AbilityScoresView(character: widget.character),
          SavingThrowsView(character: widget.character),
          SkillsProficencyView(character: widget.character),
        ],
      ),
    );
  }
}
