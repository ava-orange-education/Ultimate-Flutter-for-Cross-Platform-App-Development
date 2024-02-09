// Step 1: Create Widgets for Portrait and Landscape Modes

import 'package:flutter/material.dart';

class PortraitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portrait Mode'),
      ),
      body: Center(
        child: Text('This is the portrait mode UI.'),
      ),
    );
  }
}

class LandscapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landscape Mode'),
      ),
      body: Center(
        child: Text('This is the landscape mode UI.'),
      ),
    );
  }
}

// Step 2: Implement OrientationBuilder

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitScreen();
        } else {
          return LandscapeScreen();
        }
      },
    );
  }
}

// Step 3: Implement the Main App

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Layout'),
        ),
        body: ResponsiveLayout(),
      ),
    );
  }
}
