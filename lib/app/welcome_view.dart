import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/default/custom_button_wdgt.dart';
import 'package:keepershield_rpg/app/home_view.dart';
import 'package:keepershield_rpg/view_model/app_viewmodel.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key, collWelcomeMsg});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<String> collWelcomeMsg = [
    "Bem-vindo à terra de magia e mistério, aonde lendas ganham vida!",
    "Saudações, aventureiro! Preparado para a jornada de sua vida?",
    "Entre, herói destemido! O reino aguarda por sua bravura.",
    "O destino chama, aventureiro! Sua jornada épica começa agora.",
    "Seja bem-vindo ao reino onde as lendas são forjadas e os heróis nascem!",
    "Na terra da fantasia, sua história começa. Bem-vindo à sua aventura!",
    "Ahoy, intrépido viajante! Navegue pelos mares do desconhecido conosco.",
    "Bem-vindo ao portal da imaginação, onde cada escolha molda seu destino.",
    "Entre, viajante do além! As portas do mundo mágico estão abertas para você.",
    "Prepare-se para enfrentar desafios épicos. Bem-vindo à batalha, herói!",
    "Saudações, aventureiro corajoso! Seu destino está nas estrelas.",
    "Na terra de dragões e feitiçaria, sua saga está prestes a começar.",
    "Abra as portas da imaginação. Bem-vindo à sua própria lenda pessoal.",
    "Explore, descubra, conquiste. Sua odisséia começa agora, nobre herói.",
    "Seja bem-vindo ao reino onde sonhos se tornam realidade e pesadelos desafios.",
    "Bravos guerreiros, sua jornada épica aguarda. Bem-vindos à aventura!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo Guardião',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 250),
                child: Image.asset('assets/img/icon.png'),
              ),
              CustomButtonWdgt(
                  title: 'Aventurar-se',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text(
                  Controller.listShuffler(collection: collWelcomeMsg),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
