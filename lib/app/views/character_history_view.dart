import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';
import 'package:keepershield_rpg/app/components/default/custom_text_label_wdgt.dart';

class CharacterHistoryView extends StatefulWidget {
  const CharacterHistoryView({super.key});

  @override
  State<CharacterHistoryView> createState() => _CharacterHistoryViewState();
}

class _CharacterHistoryViewState extends State<CharacterHistoryView> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomDividerWdgt(title: 'Sobre'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: size / 2),
              child: CustomTextLabelWdgt(
                title: 'Antecedente',
                text: 'Artesão da Guilda',
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: size / 2),
              child: CustomTextLabelWdgt(
                title: 'Alinhamento',
                text: 'Caótico e Neutro',
              ),
            ),
          ],
        ),
        CustomTextLabelWdgt(
          title: 'Idiomas',
          text: 'Comum, Élfico e Anão.',
        ),
        CustomDividerWdgt(title: 'Características'),
        CustomTextLabelWdgt(
          title: 'Traço de Personalidade',
          text:
              'A primeira coisa que faço ao chegar a um novo local é decorar a localização de coisas valiosas ou onde essas coisas podem estar escondidas.',
          isBorder: true,
        ),
        CustomTextLabelWdgt(
          title: 'Ideal',
          text:
              'Eu sou leal aos meus amigos, não a qualquer ideal, e todos sabem que posso viajar até o Estige por aqueles que me importo.',
          isBorder: true,
        ),
        CustomTextLabelWdgt(
          title: 'Vínculo',
          text:
              'Eu sou culpado por um terrível crime, espero algum dia poder me redimir.',
          isBorder: true,
        ),
        CustomTextLabelWdgt(
          title: 'Defeito',
          text:
              'Quando confrontado com uma escolha entre dinheiro e amigo, eu bem que escolho o dinheiro.',
          isBorder: true,
        ),
        CustomDividerWdgt(title: 'História'),
        CustomTextLabelWdgt(
          title: 'História',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          isBorder: true,
        ),
      ],
    );
  }
}
