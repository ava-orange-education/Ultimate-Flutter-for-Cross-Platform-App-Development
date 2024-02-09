import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedCrossFadeExample());
}

class AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirstWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated CrossFade Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(seconds: 1), // Animation duration
              firstChild: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'First Widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              secondChild: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Second Widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              crossFadeState: _isFirstWidgetVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Toggle between the two widgets.
                  _isFirstWidgetVisible = !_isFirstWidgetVisible;
                });
              },
              child: Text('Toggle Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
