import 'package:flutter/material.dart';
import 'music.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Music App'),
        ),
        body: MusicList(),
      ),
    );
  }
}

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          // Use a grid layout for larger screens
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: musicData.length,
            itemBuilder: (BuildContext context, int index) {
              return MusicCard(music: musicData[index]);
            },
          );
        } else {
          // Use a list layout for smaller screens
          return ListView.builder(
            itemCount: musicData.length,
            itemBuilder: (BuildContext context, int index) {
              return MusicCard(music: musicData[index]);
            },
          );
        }
      },
    );
  }
}

class MusicCard extends StatelessWidget {
  final Music music;

  MusicCard({required this.music});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(music.title),
        subtitle: Text(music.artist),
        onTap: () {
          // Handle music item click
        },
      ),
    );
  }
}
