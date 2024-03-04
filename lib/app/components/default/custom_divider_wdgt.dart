import 'package:flutter/material.dart';

class CustomDividerWdgt extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  const CustomDividerWdgt({super.key, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Divider(),
              ),
              if (title != null) _buildTitle(context),
              Expanded(
                flex: 15,
                child: Divider(),
              ),
              if (onPressed != null) _buildButton(context, onPressed),
              Expanded(
                child: Divider(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildButton(BuildContext context, VoidCallback? onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      constraints: BoxConstraints(maxWidth: 50),
      child: TextButton(
        onPressed: onPressed,
        child: Icon(
          Icons.add,
          size: 20,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title!.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}
