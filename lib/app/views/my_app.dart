import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/pages/menu_character_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'KeeperShield RPG',
        theme: ThemeData.dark(),
        home: MenuCharacterPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
