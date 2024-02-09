import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Key;
  final String tooltip;
  final String text;

  ListItem({
    required this.key,
    required this.tooltip,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      title: Text(text),
      subtitle: Text(tooltip),
    );
  }
}
