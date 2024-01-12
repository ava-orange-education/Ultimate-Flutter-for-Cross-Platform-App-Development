import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Key key;
  final String tooltip;
  final String text;

  ListItem({
    required this.key,
    required this.tooltip,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: text, // Provide a label for screen readers
      child: ListTile(
        key: key,
        title: Text(text),
        subtitle: Text(tooltip),
      ),
    );
  }
}
