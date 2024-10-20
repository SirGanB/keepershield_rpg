import 'package:flutter/material.dart';

class CustomCardWdgt extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;

  const CustomCardWdgt({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Icon(
            icon ?? Icons.account_circle,
            size: 30,
          ),
        ),
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 8),
        ),
        trailing: Container(
          constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.delete),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
