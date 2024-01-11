import 'package:flutter/material.dart';

class CustomDividerWdgt extends StatelessWidget {
  final String? title;
  const CustomDividerWdgt({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      buildDivider(context: context, flex: 1),
      if (title?.isNotEmpty ?? false) customTitle(),
      buildDivider(context: context, flex: 3),
    ]);
  }

  Widget customTitle() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          title!.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );

  Widget buildDivider({required flex, required context}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Container(
          height: 2,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
