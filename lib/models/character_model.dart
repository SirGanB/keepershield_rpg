class CharacterModel {
  final String id;
  final String name;
  final String race;
  final List<Map<String, int>> classes;
  final int healthPoints;
  final List<Map<String, int>> abilityScores;
  final List<Map<String, bool>> savingThrows;
  final List<Map<String, int>> skills;
  final int speed;

  CharacterModel({
    required this.id,
    required this.name,
    required this.race,
    required this.classes,
    required this.healthPoints,
    required this.abilityScores,
    required this.savingThrows,
    required this.speed,
    required this.skills,
  });

  String getClasses() {
    int totalLevel = 0;

    for (var e in classes) {
      totalLevel += e.values.first;
    }

    return classes.length == 1
        ? '${classes.first.keys.first} lvl: $totalLevel'
        : 'Multiclasse, nível: $totalLevel';
  }
}
