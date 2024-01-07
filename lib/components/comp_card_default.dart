import 'package:flutter/material.dart';

class CompCardDefault extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;

  const CompCardDefault({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: Container(
            color: Colors.black,
            width: 50,
            height: 50,
            child: Icon(
              icon ?? Icons.account_circle,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            wordSpacing: 3,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
