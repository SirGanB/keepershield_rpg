class CharacterModel {
  final String id;
  final String name;
  final String race;
  final int currentHealth;
  final int maxHealth;
  final int speed;
  final List<Map<String, int>> classes;
  final List<Map<String, int>> atributes;
  final List<Map<String, bool>> saves;
  final List<Map<String, int>> skills;

  CharacterModel({
    required this.id,
    required this.name,
    required this.race,
    required this.classes,
    this.maxHealth = 1,
    this.currentHealth = 1,
    this.speed = 9,
    this.atributes = const [
      {'Strength': 10},
      {'Dexterity': 10},
      {'Constitution': 10},
      {'Intelligence': 10},
      {'Wisdom': 10},
      {'Charisma': 10},
    ],
    this.saves = const [
      {'Strength': false},
      {'Dexterity': false},
      {'Constitution': false},
      {'Intelligence': false},
      {'Wisdom': false},
      {'Charisma': false},
    ],
    this.skills = const [
      // Strength
      {'Athletics': 0},

      // Dexterity
      {'Acrobatics': 0},
      {'Stealth': 0},
      {'Sleight of Hand': 0},

      // Intelligence
      {'Arcana': 0},
      {'History': 0},
      {'Investigation': 0},
      {'Nature': 0},
      {'Religion': 0},

      // Wisdom
      {'Insight': 0},
      {'Animal Handling': 0},
      {'Medicine': 0},
      {'Perception': 0},
      {'Survival': 0},

      // Charisma
      {'Performance': 0},
      {'Deception': 0},
      {'Intimidation': 0},
      {'Persuasion': 0},
    ],
  });
}
