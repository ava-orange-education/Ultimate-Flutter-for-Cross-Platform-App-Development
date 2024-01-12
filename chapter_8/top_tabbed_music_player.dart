// Step 2: Create a Tabbed Structure

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
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Music Playlist'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note), text: 'Songs'),
                Tab(icon: Icon(Icons.favorite), text: 'Liked'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SongList(), // First tab content
              LikedSongs(), // Second tab content
            ],
          ),
        ),
      ),
    );
  }
}

// Step 3: Create a new file song_list.dart

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


// Create a new file liked_songs.dart:

import 'package:flutter/material.dart';

class LikedSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Liked Songs'),
    );
  }
}
