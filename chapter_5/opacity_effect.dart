import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyOpacityApp());
}

class MyOpacityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Opacity Example'),
        ),
        body: Center(
          child: MyOpacityWidget(),
        ),
      ),
    );
  }
}

class MyOpacityWidget extends StatelessWidget {
  const MyOpacityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5, // Adjust the opacity level (0.0 - 1.0)
      child: Container(
        color: Colors.blue,
        width: 200,
        height: 200,
        child: const Center(
          child: Text(
            'This is partially transparent text',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
