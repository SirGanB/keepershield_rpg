import 'package:flutter/material.dart';

class CustomTextLabelWdgt extends StatelessWidget {
  final String text;
  final String title;
  final bool isBorder;

  const CustomTextLabelWdgt({
    required this.text,
    required this.title,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return isBorder
        ? Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildTextLabel(context),
          )
        : _buildTextLabel(context);
  }

  Widget _buildTextLabel(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Divider(),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
