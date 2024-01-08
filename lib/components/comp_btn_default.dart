import 'package:flutter/material.dart';

class CompBtnDefault extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  const CompBtnDefault({
    Key? key,
    required this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 80),
        backgroundColor: Colors.grey,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
