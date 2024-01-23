import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/pages/login_page.dart';
import 'package:keepershield_rpg/app/pages/home_page.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:provider/provider.dart';

class AuthCheckView extends StatefulWidget {
  const AuthCheckView({super.key});

  @override
  State<AuthCheckView> createState() => _AuthCheckViewState();
}

class _AuthCheckViewState extends State<AuthCheckView> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.user == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }

  Widget loading() => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
