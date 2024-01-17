import 'package:flutter/material.dart';

class StatsBtnWdgt extends StatelessWidget {
  final String title;
  final bool enabled;
  final TextEditingController controller;

  StatsBtnWdgt({
    super.key,
    required this.title,
    required this.enabled,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 70),
      child: TextField(
        enabled: enabled,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 2,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: const OutlineInputBorder(),
          labelText: title.toUpperCase(),
          counterText: '',
        ),
      ),
    );
  }
}
