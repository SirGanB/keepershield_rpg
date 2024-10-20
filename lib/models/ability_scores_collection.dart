import 'package:objectbox/objectbox.dart';

// Marcar a classe como uma entidade do ObjectBox
@Entity()
class AbilityScoresCollection {
  int id; // ID para ObjectBox
  Strength strength;
  Dexterity dexterity;
  Constitution constitution;
  Intelligence intelligence;
  Wisdom wisdom;
  Charisma charisma;

  AbilityScoresCollection({
    this.id = 0,
    Strength? stre,
    Dexterity? dext,
    Constitution? cons,
    Intelligence? inte,
    Wisdom? wisd,
    Charisma? char,
  })  : strength = stre ?? Strength(),
        dexterity = dext ?? Dexterity(),
        constitution = cons ?? Constitution(),
        intelligence = inte ?? Intelligence(),
        wisdom = wisd ?? Wisdom(),
        charisma = char ?? Charisma();
}

// Definindo cada classe de habilidade como uma entidade
@Entity()
class Strength {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Strength({this.id = 0, this.value = 10}); // Valor padrão
}

@Entity()
class Dexterity {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Dexterity({this.id = 0, this.value = 10}); // Valor padrão
}

@Entity()
class Constitution {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Constitution({this.id = 0, this.value = 10}); // Valor padrão
}

@Entity()
class Intelligence {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Intelligence({this.id = 0, this.value = 10}); // Valor padrão
}

@Entity()
class Wisdom {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Wisdom({this.id = 0, this.value = 10}); // Valor padrão
}

@Entity()
class Charisma {
  int id; // ID para ObjectBox
  int value; // Valor da habilidade

  Charisma({this.id = 0, this.value = 10}); // Valor padrão
}
