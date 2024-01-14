class CharacterModel {
  final String id;
  final String name;
  final String race;
  final List<Map<String, dynamic>> classes;
  final int healthPoints;
  final List<int> abilityScores;
  final List<bool> savingThrows;

  CharacterModel({
    required this.id,
    required this.name,
    required this.race,
    required this.classes,
    required this.healthPoints,
    required this.abilityScores,
    required this.savingThrows,
  });

  String getClasses() {
    int totalLevel = 0;

    for (var e in classes) {
      if (e.containsKey('level')) {
        totalLevel += e['level'] as int;
      }
    }

    return classes.length == 1
        ? '${classes.first['class']}, nível: $totalLevel'
        : 'Multiclasse, nível: $totalLevel';
  }
}
