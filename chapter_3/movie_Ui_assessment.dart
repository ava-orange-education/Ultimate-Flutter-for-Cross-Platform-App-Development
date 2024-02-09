import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
// Sample data for movie titles, descriptions, and posters
  final List<String> movieTitles = [
    'TRANSFORMERS Rise of the Beasts (2023)',
    'Movie 2',
    'Movie 3',
    'Movie 4',
    'Movie 5',
  ];

  final List<String> movieDescriptions = [
    'Description for Movie 1',
    'Description for Movie 2',
    'Description for Movie 3',
    'Description for Movie 4',
    'Description for Movie 5',
  ];

  final List<String> moviePosters = [
    'https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l500.jpg',
    'https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l500.jpg',
    'https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l500.jpg',
    'https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l500.jpg',
    'https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l500.jpg',
  ];

  MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List App'),
      ),
      body: ListView.builder(
        itemCount: movieTitles.length,
        itemBuilder: (context, index) {
          // Leading image for the movie poster
          return ListTile(
            leading: Image.network(
              moviePosters[index],
              width: 60,
              height: 80,
              fit: BoxFit.cover,
            ),
            // Movie title with styling
            title: Text(
              movieTitles[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Movie description
            subtitle: Text(
              movieDescriptions[index],
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}
