import 'package:keepershield_rpg/models/ability_model.dart';

class AbilityScoresCollection {
  late Strength strength;
  late Dexterity dexterity;
  late Constitution constitution;
  late Intelligence intelligence;
  late Wisdom wisdom;
  late Charisma charisma;

  AbilityScoresCollection({
    Strength? stre,
    Dexterity? dext,
    Constitution? cons,
    Intelligence? inte,
    Wisdom? wisd,
    Charisma? char,
  }) {
    strength = stre ?? Strength();
    dexterity = dext ?? Dexterity();
    constitution = cons ?? Constitution();
    intelligence = inte ?? Intelligence();
    wisdom = wisd ?? Wisdom();
    charisma = char ?? Charisma();
  }
}
