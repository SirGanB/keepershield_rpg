import 'package:flutter/material.dart';

class CustomButtonWdgt extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomButtonWdgt({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  State<CustomButtonWdgt> createState() => _CustomButtonWdgtState();
}

class _CustomButtonWdgtState extends State<CustomButtonWdgt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(240, 60),
        ),
        child: widget.child,
      ),
    );
  }
}
