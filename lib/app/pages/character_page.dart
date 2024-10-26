import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/_lib_components.dart';
import 'package:keepershield_rpg/app/views/ability_scores_view.dart';
import 'package:keepershield_rpg/app/views/character_history_view.dart';
import 'package:keepershield_rpg/app/views/character_profile_view.dart';
import 'package:keepershield_rpg/app/views/saving_throws_view.dart';
import 'package:keepershield_rpg/app/views/skills_proficiency_view.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:keepershield_rpg/view_model/character_viewmodel.dart';
import 'package:provider/provider.dart';

// Definicao da pagina de personagem, que exibe as informacoes e atributos do personagem
class CharacterPage extends StatefulWidget {
  // Atributo para o viewmodel do personagem
  final CharacterViewModel character;

  // Construtor da pagina de personagem
  const CharacterPage({super.key, required this.character});

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

// Estado da pagina de personagem, que define o comportamento dinamico da tela
class _CharacterPageState extends State<CharacterPage> {
  // Index da tela atualmente selecionada no BottomNavigationBar
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Obtem o CharactersRepository atraves do Provider
    final charRep = Provider.of<CharactersRepository>(context);

    // Verifica se o repositório foi inicializado
    if (!charRep.isInitialized) {
      // Inicia o processo de inicializacao se nao foi inicializado
      return const Center(child: CircularProgressIndicator());
    }

    // Provider que envolve o viewmodel do personagem e notifica as alteracoes na interface
    return ChangeNotifierProvider.value(
      value: widget.character,
      child: Scaffold(
        // Corpo principal da tela
        body: Column(
          children: [
            // Exibe o perfil do personagem (nome, imagem, etc)
            CharacterProfileView(character: widget.character),
            // Area expandida para exibir os conteudos detalhados das views
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Exibe a view de atributos se a tela 0 estiver selecionada
                      if (_screenIndex == 0) _buildScoresView(),
                      // Exibe a view de historia se a tela 1 estiver selecionada
                      if (_screenIndex == 1) _buildHistoryView(),
                      // Exibe a view de armamento se a tela 2 estiver selecionada
                      if (_screenIndex == 2) _buildArmoryView(),
                      // Exibe outra view para a tela 3
                      if (_screenIndex == 3) Text('View 4'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        // Barra de navegacao na parte inferior para alternar entre as diferentes views
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _screenIndex, // Define a tela selecionada
          selectedItemColor: Theme.of(context).colorScheme.primary, // Cor do item selecionado
          unselectedItemColor: Theme.of(context).colorScheme.outline, // Cor dos itens nao selecionados
          onTap: (index) {
            // Atualiza o estado para alterar a tela selecionada
            setState(() {
              _screenIndex = index;
            });
          },
          items: const [
            // Icones e labels da barra de navegacao
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Atributos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Historia',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Arsenal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              label: 'View 4',
            ),
          ],
        ),
      ),
    );
  }

  // Constroi a view de atributos, exibindo pontuacoes de habilidades e proficiencias
  Widget _buildScoresView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Exibe a view dos scores de habilidade
          AbilityScoresView(char: widget.character),
          // Exibe a view de testes de resistencia
          SavingThrowsView(character: widget.character),
          // Exibe a view de proficiencia de habilidades
          SkillsProficencyView(character: widget.character)
        ],
      ),
    );
  }

  // Constroi a view de historia do personagem
  Widget _buildHistoryView() {
    return SingleChildScrollView(
      child: CharacterHistoryView(),
    );
  }

  // Constroi a view de armamento do personagem
  Widget _buildArmoryView() {
    return SingleChildScrollView(
      child: CharacterArmoryView(),
    );
  }
}
