import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/character_sheet/label_ability_scores_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/models/ability_model.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

class AbilityScoresView extends StatefulWidget {
  final CharacterViewModel character;
  const AbilityScoresView({super.key, required this.character});

  @override
  State<AbilityScoresView> createState() => _AbilityScoresViewState();
}

class _AbilityScoresViewState extends State<AbilityScoresView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(builder: (context, character, child) {
      return Column(children: [
        const CustomDividerWdgt(title: 'Valores de Atributos'),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup(
                    labelText: 'FOR',
                    ability: Strength(),
                  );
                },
                child: LabelAbilityScores(
                  title: 'Força',
                  ability: widget.character.abilityScores.strength,
                ),
              ),
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup(
                    labelText: 'DEX',
                    ability: Dexterity(),
                  );
                },
                child: LabelAbilityScores(
                  title: 'Destreza',
                  ability: widget.character.abilityScores.dexterity,
                ),
              ),
              GestureDetector(
                onLongPressStart: (details) {
                  _showEditPopup(
                    labelText: 'CON',
                    ability: Constitution(),
                  );
                },
                child: LabelAbilityScores(
                  title: 'Constituição',
                  ability: widget.character.abilityScores.constitution,
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
                  labelText: 'INT',
                  ability: Intelligence(),
                );
              },
              child: LabelAbilityScores(
                title: 'Inteligência',
                ability: widget.character.abilityScores.intelligence,
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) {
                _showEditPopup(
                  labelText: 'SAB',
                  ability: Wisdom(),
                );
              },
              child: LabelAbilityScores(
                title: 'Sabedoria',
                ability: widget.character.abilityScores.wisdom,
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) {
                _showEditPopup(
                  labelText: 'CAR',
                  ability: Charisma(),
                );
              },
              child: LabelAbilityScores(
                title: 'Carisma',
                ability: widget.character.abilityScores.charisma,
              ),
            ),
          ],
        ),
      ]);
    });
  }

  _showEditPopup({required AbilityModel ability, required String labelText}) {
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
                        labelText: labelText,
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      widget.character.updateAbilityScore(
                        value: int.parse(controller.text),
                        ability: ability,
                      );

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
