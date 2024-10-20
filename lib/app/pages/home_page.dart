import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/pages/menu_character_page.dart';
import 'package:keepershield_rpg/app/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('KeeperShield RPG'),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                _buildTab(icon: Icons.switch_account, text: 'Personagens'),
                Tab(child: Icon(Icons.settings)),
              ]),
        ),
        body: TabBarView(children: [
          MenuCharacterPage(),
          SettingsPage(),
        ]),
      ),
    );
  }

  Widget _buildTab({required IconData icon, required String text}) {
    return Tab(
      child: Container(
        constraints: BoxConstraints(maxWidth: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, size: 15),
            Text(
              text.toUpperCase(),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
