import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: MyPlaylistScreen(),
        );
      },
    );
  }
}

class MusicTrack {
  final String title;
  final String artist;
  final String album;
  final String genre;
  final String duration;
  final String imageUrl;

  MusicTrack({
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    required this.duration,
    required this.imageUrl,
  });
}

List<MusicTrack> mockPlaylist = [
  MusicTrack(
    title: 'Song 1',
    artist: 'Artist 1',
    album: 'Album 1',
    genre: 'Pop',
    duration: '3:30',
    imageUrl: 'url1',
  ),
  MusicTrack(
    title: 'Song 2',
    artist: 'Artist 2',
    album: 'Album 2',
    genre: 'Rock',
    duration: '4:15',
    imageUrl: 'url2',
  ),
  // ... add more tracks
];

class MyPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Playlist'),
      ),
      body: ListView.builder(
        itemCount: mockPlaylist.length,
        itemBuilder: (context, index) {
          return buildTrackCard(context, mockPlaylist[index]);
        },
      ),
    );
  }

  Widget buildTrackCard(BuildContext context, MusicTrack track) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            // Left side: Album cover
            Container(
              height: 120.h, // Set a fixed height for the album cover
              width: 120.w, // Set a fixed width for the album cover
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(track.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Right side: Track details
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      track.title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${track.artist} • ${track.album}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      track.genre,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      track.duration,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
