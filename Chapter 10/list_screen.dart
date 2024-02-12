import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Finder Example'),
      ),
      body: ListView(
        children: [
          ListItem(
            key: Key('item_1'),
            tooltip: 'Item 1 Tooltip',
            text: 'Item 1 Text',
          ),
          ListItem(
            key: Key('item_2'),
            tooltip: 'Item 2 Tooltip',
            text: 'Item 2 Text',
          ),
          // Add more ListItems as needed
        ],
      ),
    );
  }
}
