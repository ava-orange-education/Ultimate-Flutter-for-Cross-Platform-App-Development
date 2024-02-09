//  Create Bottom Tabbed Structure

import 'package:flutter/material.dart';
import 'screens/song_list.dart';
import 'screens/liked_songs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Playlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// Create HomeScreen Widget

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}
  class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    SongList(), // First tab content
    LikedSongs(), // Second tab content
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Playlist'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
        ],
      ),
    );
  }
}

// Create Tab Content

import 'package:flutter/material.dart';
import 'package:modern_flutter/music_player_screen.dart';
import 'package:modern_flutter/track.dart';

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Music> musicList = DataProvider.getMusicList();

    return Scaffold(
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
            },
          );
        },
      ),
    );
  }
}



class LikedSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Liked Songs'),
    );
  }
}
