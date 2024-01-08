import 'package:flutter/material.dart';
import 'package:rpg_keeper_hub/views/home/character%20view/menu_character_view.dart';
import 'package:rpg_keeper_hub/views/home/table%20view/menu_table_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'RPG Keeper',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepOrange,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.castle_rounded),
                        SizedBox(width: 10),
                        Text('Tables'),
                      ]),
                ),
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_box),
                        SizedBox(width: 10),
                        Text('Characters'),
                      ]),
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            MenuTableView(),
            CharacterView(),
          ],
        ),
      ),
    );
  }
}
