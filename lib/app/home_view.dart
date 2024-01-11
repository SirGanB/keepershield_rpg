import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/view/character_view/menu_character_view.dart';
import 'package:keepershield_rpg/app/view/table_view/menu_table_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('KeeperShield RPG'),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                Tab(child: Text('Mesas')),
                Tab(child: Text('Personagens')),
              ]),
        ),
        body: TabBarView(children: [
          MenuTableView(),
          CharacterView(),
        ]),
      ),
    );
  }
}
