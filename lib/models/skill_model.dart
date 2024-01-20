import 'package:keepershield_rpg/models/definitions.dart';

class SkillModel {
  final String name;
  final int value;
  final ProficiencyType proficiency;

  SkillModel({
    required this.name,
    required this.value,
    required this.proficiency,
  });
}
