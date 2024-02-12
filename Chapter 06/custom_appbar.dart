import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Custom App Bar',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(), // Use the custom app bar here
        body: Center(
          child: Text('Your App Content Goes Here'),
        ),
      ),
    );
  }
}
