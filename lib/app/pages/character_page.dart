import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:provider/provider.dart';
import 'package:keepershield_rpg/app/views/ability_scores_view.dart';
import 'package:keepershield_rpg/app/views/character_history_view.dart';
import 'package:keepershield_rpg/app/views/character_profile_view.dart';
import 'package:keepershield_rpg/app/views/saving_throws_view.dart';
import 'package:keepershield_rpg/app/views/skills_profiency_view.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';

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
            CharacterProfileView(character: widget.character),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (_screenIndex == 0) _buildScoresView(),
                      if (_screenIndex == 1) _buildHistoryView(),
                      if (_screenIndex == 2) _buildArmoryView(),
                      if (_screenIndex == 3) Text('View 4'),
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
              icon: Icon(Icons.book),
              label: 'História',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Arsenal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              label: 'View 4',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoresView() {
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

  _buildHistoryView() {
    return SingleChildScrollView(
      child: CharacterHistoryView(),
    );
  }

  Widget _buildArmoryView() {
    return SingleChildScrollView(
      child: CharacterArmoryView(),
    );
  }
}
