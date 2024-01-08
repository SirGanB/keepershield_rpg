import 'package:flutter/material.dart';
import 'package:rpg_keeper_hub/components/comp_card_default.dart';
import 'package:rpg_keeper_hub/models/rpg_table.dart';
import 'package:rpg_keeper_hub/views/Home/Table%20View/table_view.dart';

class MenuTableView extends StatelessWidget {
  const MenuTableView({super.key});

  @override
  Widget build(BuildContext context) {
    List<RpgTable> collTables = [
      RpgTable(
        title: 'Radiata',
        subtitle: 'Hold your weapon, and fight against the dragons.',
        owner: 'José C. P.',
      ),
      RpgTable(
          title: 'About Munduz',
          subtitle: 'Select the age, and come to fight against the gods.',
          owner: 'Gustavo A. N.'),
    ];
    return ListView(children: [
      for (final table in collTables)
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TableView(table: table),
              ),
            );
          },
          child: CompCardDefault(
            title: table.title,
            subtitle: table.subtitle,
          ),
        ),
    ]);
  }
}
