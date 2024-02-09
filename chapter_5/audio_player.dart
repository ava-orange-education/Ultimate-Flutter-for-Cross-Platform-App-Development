import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AudioPlayerApp(),
    );
  }
}

class AudioPlayerApp extends StatefulWidget {
  const AudioPlayerApp({Key? key}) : super(key: key);

  @override
  _AudioPlayerAppState createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                int result = await audioPlayer.play(
                  'assets/audio.mp3',
                  isLocal: true,
                );
                if (result == 1) {
                  print('Audio played successfully.');
                } else {
                  print('Error playing audio.');
                }
              },
              child: const Text('Play Audio'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.pause();
              },
              child: const Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.stop();
              },
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
