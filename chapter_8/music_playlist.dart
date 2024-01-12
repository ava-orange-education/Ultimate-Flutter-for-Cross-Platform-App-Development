// models.dart

class Music {
  final String title;
  final String artist;
  final String album;
  final String coverUrl;

  Music({
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
  });
}

// data_provider.dart
import 'models.dart';

class DataProvider {
  static List<Music> getMusicList() {
    return [
      Music(
        title: 'Song 1',
        artist: 'Artist 1',
        album: 'Album 1',
        coverUrl: 'url_to_image',
      ),
      // Add more mock data
    ];
  }
}

// playlist_screen.dart
import 'package:flutter/material.dart';
import 'data_provider.dart';
import 'models.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Music> musicList = DataProvider.getMusicList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Music Playlist'),
      ),
      body: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (context, index) {
          Music music = musicList[index];
          return ListTile(
            title: Text(music.title),
            subtitle: Text('${music.artist} - ${music.album}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(music.coverUrl),
            ),
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MusicPlayerScreen(music: music),
    ),
  );
}
   ,
          );
        },
      ),
    );
  }
}


// music_player_screen.dart

class MusicPlayerScreen extends StatelessWidget {
  final Music music;

  MusicPlayerScreen({required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              music.coverUrl,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              music.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('${music.artist} - ${music.album}'),
            // Add music controls here (play, pause, etc.)
          ],
        ),
      ),
    );
  }
}


// main.dart
import 'package:flutter/material.dart';
import 'playlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlaylistScreen(),
    );
  }
}
