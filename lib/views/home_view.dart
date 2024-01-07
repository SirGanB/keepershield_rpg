import 'package:flutter/material.dart';
import 'package:rpg_keeper_hub/views/home/character_view.dart';
import 'package:rpg_keeper_hub/views/home/table_view.dart';

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
            'RPG Keeper HUB',
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
                        Icon(Icons.recent_actors_rounded),
                        SizedBox(width: 10),
                        Text('Characters'),
                      ]),
                ),
                Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.castle_rounded),
                        SizedBox(width: 10),
                        Text('Tables'),
                      ]),
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            CharacterView(),
            TableView(),
          ],
        ),
      ),
    );
  }
}
