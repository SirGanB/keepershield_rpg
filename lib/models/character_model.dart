import 'package:keepershield_rpg/models/classe_model.dart';
import 'package:objectbox/objectbox.dart';

// Marca a classe como uma entidade do ObjectBox
@Entity()
class CharacterModel {
  int id; // ID para ObjectBox
  String name; // Nome do personagem
  String race; // Raça do personagem
  int currentHealth; // Vida atual
  int maxHealth; // Vida máxima
  int speed; // Velocidade do personagem
  final classes = ToMany<ClasseModel>(); // Relação ToMany

  int strength; // Pontuação de força
  int dexterity; // Pontuação de destreza
  int constitution; // Pontuação de constituição
  int intelligence; // Pontuação de inteligência
  int wisdom; // Pontuação de sabedoria
  int charisma; // Pontuação de carisma

  // Construtor da classe
  CharacterModel({
    this.id = 0,
    this.name = '',
    this.race = '',
    this.currentHealth = 1,
    this.maxHealth = 1,
    this.speed = 9,
    this.strength = 10, // Valor padrão de força
    this.dexterity = 10, // Valor padrão de destreza
    this.constitution = 10, // Valor padrão de constituição
    this.intelligence = 10, // Valor padrão de inteligência
    this.wisdom = 10, // Valor padrão de sabedoria
    this.charisma = 10, // Valor padrão de carisma
  });
}
