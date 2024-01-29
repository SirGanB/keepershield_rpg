import 'package:keepershield_rpg/models/definitions.dart';

abstract class SkillModel {
  ProficiencyType proficiency;

  SkillModel({required this.proficiency});
}

class Acrobatics extends SkillModel {
  Acrobatics({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class AnimalHandling extends SkillModel {
  AnimalHandling({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Arcana extends SkillModel {
  Arcana({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Athletics extends SkillModel {
  Athletics({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Deception extends SkillModel {
  Deception({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class History extends SkillModel {
  History({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Insight extends SkillModel {
  Insight({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Intimidation extends SkillModel {
  Intimidation({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Investigation extends SkillModel {
  Investigation({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Medicine extends SkillModel {
  Medicine({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Nature extends SkillModel {
  Nature({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Perception extends SkillModel {
  Perception({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Performance extends SkillModel {
  Performance({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Persuasion extends SkillModel {
  Persuasion({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Religion extends SkillModel {
  Religion({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class SleightOfHand extends SkillModel {
  SleightOfHand({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Stealth extends SkillModel {
  Stealth({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}

class Survival extends SkillModel {
  Survival({ProficiencyType? proficiency})
      : super(proficiency: proficiency ?? ProficiencyType.NonProficient);
}
