import 'package:objectbox/objectbox.dart';

// Classe que representa as classes de um personagem
@Entity()
class ClasseModel {
  int id; // ID para ObjectBox
  String name; // Nome da classe
  int level; // Nível da classe

  // Construtor da classe
  ClasseModel({
    this.id = 0,
    this.name = '',
    this.level = 1,
  });
}
