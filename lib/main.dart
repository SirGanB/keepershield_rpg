import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'KeeperShield RPG',
        theme: ThemeData(brightness: Brightness.light),
        home: const WelcomeView(),
      ),
    );
  }
}
