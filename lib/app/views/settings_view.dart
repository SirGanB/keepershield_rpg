import 'package:flutter/material.dart';
import 'package:keepershield_rpg/repository/characters_repository.dart';
import 'package:keepershield_rpg/repository/tables_repository.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late CharactersRepository characters;
  late TablesRepository tables;

  @override
  Widget build(BuildContext context) {
    tables = Provider.of<TablesRepository>(context);
    characters = Provider.of<CharactersRepository>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        customBtn(
          context,
          text: 'Sair',
          onPressed: () => AuthService().logout(),
        ),
      ]),
    );
  }

  Widget customBtn(
    BuildContext context, {
    required VoidCallback onPressed,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8.0)),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
