import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedContainerExample());
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              // Toggle the size of the container.
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1), // Animation duration
            width: _isExpanded ? 200.0 : 100.0, // Toggle width
            height: _isExpanded ? 200.0 : 100.0, // Toggle height
            color: _isExpanded ? Colors.blue : Colors.green, // Toggle color
            child: Center(
              child: Text(
                'Tap Me!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
