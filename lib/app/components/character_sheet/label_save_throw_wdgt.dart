import 'package:flutter/material.dart';
import 'package:keepershield_rpg/app/components/default/custom_divider_wdgt.dart';

class LabelSaveTrowWdgt extends StatelessWidget {
  const LabelSaveTrowWdgt({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      _header(context),
    ]);
  }

  Widget _header(context) {
    return const Column(children: [
      CustomDividerWdgt(title: 'SalvaGuarda'),
      SizedBox(height: 100, child: Center(child: Text('Coming Soon'))),
      CustomDividerWdgt(),
    ]);
  }
}
