import 'package:flutter/material.dart';

class CustomCardWdgt extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  const CustomCardWdgt({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              icon ?? Icons.account_circle,
              size: 45,
            ),
          ),
        ),
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 10),
        ),
        trailing: Container(
          constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
          child: TextButton(
            onPressed: onPressed,
            child: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
