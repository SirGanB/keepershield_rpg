import 'package:flutter/material.dart';

class CompLabelSaveTrow extends StatelessWidget {
  const CompLabelSaveTrow({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      _header(),
    ]);
  }

  Widget _header() {
    return Column(children: [
      Row(children: [
        Expanded(
          child: Container(
            height: 2,
            width: 50,
            color: const Color.fromARGB(255, 90, 13, 8),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            'Saving Throw',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 90, 13, 8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: 2,
            width: 50,
            color: const Color.fromARGB(255, 90, 13, 8),
          ),
        ),
      ]),
    ]);
  }
}
