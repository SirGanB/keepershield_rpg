import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:keepershield_rpg/models/_lib_model.dart';
import 'package:keepershield_rpg/objectbox.g.dart';

class CharactersRepository extends ChangeNotifier {
  final Store _store;
  late final Box<CharacterModel> _characterBox;

  final List<CharacterModel> _characters = [];
  bool _isInitialized = false;

  // Construtor que recebe o Store
  CharactersRepository(this._store);

  // Metodo público para inicializar o repositório e carregar os personagens
  Future<void> initialize() async {
    // Define a caixa para personagens
    _characterBox = _store.box<CharacterModel>();
    await _loadAll();
    _isInitialized = true;
    notifyListeners();
  }

  // Metodo para carregar todos os personagens salvos no ObjectBox
  Future<void> _loadAll() async {
    _characters.clear(); // Limpa a lista local de personagens

    // Recupera todos os personagens do banco de dados e os adiciona à lista local
    final query = _characterBox.query().build();
    final results = query.find();
    _characters.addAll(results);

    query.close(); // Fecha a query para liberar recursos
  }

  // Metodo para obter uma lista imutável de personagens
  UnmodifiableListView<CharacterModel> get characters =>
      UnmodifiableListView(_characters);

  // Metodo para criar ou atualizar um personagem
  void create({required CharacterModel character}) {
    // Se o personagem não tem um ID, cria um novo ID
    if (character.id == 0) {
      // Insere o personagem no banco de dados
      _characterBox.put(character);
    } else {
      _characterBox.put(character,
          // Atualiza o personagem se ele já existir
          mode: PutMode.update);
    }

    // Atualiza a lista local de personagens
    _characters.removeWhere((char) => char.id == character.id);
    _characters.add(character);

    // Notifica listeners sobre a mudança na lista de personagens
    notifyListeners();
  }

  // Método para deletar um personagem
  void delete(CharacterModel character) {
    // Remove o personagem do banco de dados pelo ID
    _characterBox.remove(character.id);
    // Remove o personagem da lista local
    _characters.remove(character);

    // Notifica listeners sobre a mudança
    notifyListeners();
  }

  // Verifica se o repositório foi inicializado
  bool get isInitialized => _isInitialized;
}
