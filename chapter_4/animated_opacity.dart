import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedOpacityExample());
}

class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(seconds: 1), // Animation duration
              opacity:
                  _isVisible ? 1.0 : 0.0, // Change opacity based on _isVisible
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Fading Widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Toggle the visibility of the widget.
                  _isVisible = !_isVisible;
                });
              },
              child: Text('Toggle Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
