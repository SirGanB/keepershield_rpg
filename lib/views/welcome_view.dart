import 'package:flutter/material.dart';
import 'package:keepershield_rpg/components/comp_btn_default.dart';
import 'package:keepershield_rpg/utils/controller.dart';
import 'package:keepershield_rpg/views/home_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key, collWelcomeMsg});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  List<String> collWelcomeMsg = [
    "Welcome, brave adventurers! Your journey begins here in the realm of endless possibilities.",
    "Greetings, fellow storytellers! May your dice be ever in your favor as you embark on epic quests.",
    "Hail, heroes! Dive into the world of imagination, where every choice shapes your destiny.",
    "Salutations, dungeon delvers! Prepare for a tapestry of tales and the roll of destiny.",
    "Greetings, wanderers of worlds! Your destiny unfolds at the crossroads of fantasy and reality.",
    "Welcome, champions of the tabletop! Unleash your creativity and let the adventure commence!",
    "Greetings, party of adventurers! The table is set, and the stage is yours. Forge your own legend!",
    "Salute, roleplayers! May your characters be legendary and your stories unforgettable.",
    "Welcome, quest-seekers! Embrace the unknown, for in these realms, your fate is written by the roll of the dice.",
    "Hail, companions of the quest! Together, let's weave a tale of magic, mystery, and daring deeds.",
    "Greetings, fellow travelers! Your journey unfolds at the intersection of imagination and camaraderie.",
    "Welcome to the land of imagination! May your adventures be bold, and your dice ever true.",
    "Salutations, party planners! Your epic tale awaits, filled with challenges, triumphs, and a touch of the extraordinary.",
    "Greetings, roleplaying renegades! The stage is set, the dice are ready – let the saga begin!",
    "Welcome, legends in the making! Unleash your creativity and let the quest unfold.",
    "Hail, dice wielders! Your presence adds magic to this digital realm of storytelling.",
    "Greetings, keepers of character sheets! Your epic adventure is about to commence. Roll initiative!",
    "Salutations, keepers of the narrative flame! May your stories be rich, and your dice ever merciful.",
    "Welcome, myth-makers! Embrace the chaos, for within it lies the essence of unforgettable tales.",
    "Hail, digital dungeon masters! Your realm awaits, filled with challenges, treasures, and endless possibilities.",
    "Greetings, masters of the virtual realm! The dice are ready, the stories are waiting – let the adventure unfold!",
    "Welcome, dice rollers extraordinaire! The world of imagination bows to your every whim.",
    "Salutations, architects of alternate realities! May your campaigns be legendary, and your players courageous.",
    "Hail, keepers of the pixelated parchment! Your virtual quill is mighty – inscribe tales that resonate through the ages.",
    "Greetings, storytellers of the screen! May your narratives be as captivating as the roll of a natural 20.",
    "Welcome, adventurers of the interface! Your journey begins with a click and unfolds with every keystroke.",
    "Salutations, guardians of the virtual dice! The realm awaits your influence – let the stories unfold.",
    "Hail, guardians of the digital realm! Navigate the binary landscape and craft tales that transcend the virtual divide.",
    "Greetings, code-weaving storytellers! May your algorithms be as unpredictable as the whims of fate.",
    "Welcome, architects of interactive epics! Your presence adds layers to the canvas of endless narratives.",
    "Salutations, keepers of the digital flame! May your code be elegant, and your stories epic.",
    "Hail, pixelated pathfinders! Navigate the virtual wilderness and uncover stories that defy expectations.",
    "Greetings, adventurers of the keyboard! Your quests begin with a click, and your stories unfold with each stroke.",
    "Welcome, scribes of the screen! In this digital realm, your words hold the power to shape worlds.",
    "Salutations, virtuoso storytellers! Your digital quill is poised – let the tales flow.",
    "Hail, architects of the virtual tapestry! Your coding prowess shapes realms where imagination knows no bounds.",
    "Greetings, masters of the virtual dice roll! May your algorithms be fair, and your stories enthralling.",
    "Welcome, keepers of the virtual codex! Your presence adds a touch of magic to the binary landscape.",
    "Salutations, navigators of the digital narrative! May your campaigns be filled with twists and turns, much like a well-crafted line of code.",
    "Hail, composers of digital sonnets! Your keyboard is your quill – let the symphony of stories begin.",
    "Greetings, denizens of the digital realm! Your quest for unforgettable stories begins at the click of a button.",
    "Welcome, guardians of the virtual gateway! Step into the unknown, where every line of code is a step in an epic journey.",
    "Salutations, adventurers of the algorithm! Unleash your creativity and let the binary realms echo with tales of valor.",
    "Hail, scriptwriters of the screen! Your lines of code are the threads that weave the fabric of captivating narratives.",
    "Greetings, digital storytellers! May your quests be bug-free and your characters forever memorable.",
    "Welcome, creators of digital sagas! Your coding skills shape worlds where imagination reigns supreme.",
    "Salutations, keepers of the virtual flame! Ignite the pixels with the fire of storytelling brilliance.",
    "Hail, architects of the digital adventure! May your keyboards echo with the resounding cheers of epic tales.",
    "Greetings, wielders of the virtual quill! Your strokes shape landscapes where pixels breathe with life.",
    "Welcome, adventurers of the code! In this digital realm, your creativity is the key to unlocking worlds of wonder and excitement.",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Be Welcome Keeper",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromRGBO(224, 224, 224, 1),
                  fontSize: screenSize.height * 0.06,
                ),
              ),
              Image.network(
                'https://cdn.pixabay.com/photo/2022/11/18/17/48/hylian-shield-7600613_1280.png',
                width: screenSize.height * 0.3,
              ),
              CompBtnDefault(
                  title: 'Start Adventure',
                  color: const Color.fromRGBO(117, 117, 117, 1),
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
                    fontSize: screenSize.height * 0.015,
                    color: const Color.fromRGBO(224, 224, 224, 1),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
