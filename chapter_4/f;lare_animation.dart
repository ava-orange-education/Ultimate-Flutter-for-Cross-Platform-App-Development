import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(FlareAnimationExample());
}

class FlareAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flare Animation Example'),
      ),
      body: Center(
        child: FlareActor(
          'assets/your_animation.flr', // Path to your .flr file
          animation: 'idle', // Specify the animation to play
        ),
      ),
    );
  }
}
