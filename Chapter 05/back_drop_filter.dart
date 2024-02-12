import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyBackdropFilterApp());
}

class MyBackdropFilterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BackdropFilter Example'),
        ),
        body: Center(
          child: MyBackdropFilterWidget(),
        ),
      ),
    );
  }
}

class MyBackdropFilterWidget extends StatelessWidget {
  const MyBackdropFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image or content
        Image.asset(
          'leather.png', // Replace with your image path
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Apply BackdropFilter
        BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
          child: Container(
            color: Colors.black
                .withOpacity(0.2), // Adjust overlay color and opacity
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Your content goes here
        const Center(
          child: Text(
            'Hello, BackdropFilter!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
