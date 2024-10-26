import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_ability_scores_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class AbilityScoresView extends StatefulWidget {
  final CharacterViewModel char;
  const AbilityScoresView({super.key, required this.char});

  @override
  State<AbilityScoresView> createState() => _AbilityScoresViewState();
}

class _AbilityScoresViewState extends State<AbilityScoresView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(builder: (context, char, w) {
      return Column(children: [
        const CustomDividerWdgt(title: 'Valores de Atributos'),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup();
                },
                child: LabelAbilityScores(
                  title: 'Força',
                  ability: char.strength,
                ),
              ),
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup(                  );
                },
                child: LabelAbilityScores(
                  title: 'Destreza',
                  ability: char.dexterity,
                ),
              ),
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup(
                  );
                },
                child: LabelAbilityScores(
                  title: 'Constituição',
                  ability: char.constitution,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onLongPressStart: (details) {
                _showEditPopup(
                );
              },
              child: LabelAbilityScores(
                title: 'Inteligencia',
                ability: char.intelligence,
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) {
                _showEditPopup(
                );
              },
              child: LabelAbilityScores(
                title: 'Sabedoria',
                ability: char.wisdom,
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) {
                _showEditPopup(
                );
              },
              child: LabelAbilityScores(
                title: 'Carisma',
                ability: char.charisma,
              ),
            ),
          ],
        ),
      ]);
    });
  }

  _showEditPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Alterar valor de atributo:'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 80),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.clear();
                    },
                    child: Text('OK'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
