import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/views/auth_check_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'KeeperShield RPG',
        theme: ThemeData.dark(),
        home: const AuthCheckView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
