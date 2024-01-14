import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/views/character_view/menu_character_view.dart';
import 'package:keepershield_rpg/app/views/settings_view.dart';
import 'package:keepershield_rpg/app/views/table_view/menu_table_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('KeeperShield RPG'),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                Tab(child: Icon(Icons.groups)),
                Tab(child: Icon(Icons.accessibility)),
                Tab(child: Icon(Icons.settings)),
              ]),
        ),
        body: const TabBarView(children: [
          MenuTableView(),
          MenuCharacterView(),
          SettingsView(),
        ]),
      ),
    );
  }
}
