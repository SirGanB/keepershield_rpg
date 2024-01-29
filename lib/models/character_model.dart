import 'package:keepershield_rpg/models/_lib_model.dart';

class CharacterModel {
  String id;
  String name;
  String race;
  int currentHealth;
  int maxHealth;
  int speed;
  List<Map<String, int>> classes;
  late AbilityScoresCollection abilityScores;

  CharacterModel({
    this.id = '',
    this.name = '',
    this.race = '',
    this.currentHealth = 1,
    this.maxHealth = 1,
    this.speed = 9,
    required this.classes,
    AbilityScoresCollection? abilities,
  }) {
    abilityScores = abilities ?? AbilityScoresCollection();
  }
}
