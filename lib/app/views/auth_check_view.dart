import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/views/home_view.dart';
import 'package:keepershield_rpg/app/views/login_view.dart';
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
      return const LoginView();
    } else {
      return const HomeView();
    }
  }

  Widget loading() => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
