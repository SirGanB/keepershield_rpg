import 'package:flutter/material.dart';
import 'package:keepershield_rpg/repository/table_repository.dart';
import 'package:keepershield_rpg/services/auth.service.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late TableRepository tables;

  @override
  Widget build(BuildContext context) {
    tables = Provider.of<TableRepository>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(8.0)),
          child: TextButton(
            child: Text(
              'Sair'.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: () => AuthService().logout(),
          ),
        ),
      ]),
    );
  }
}
