// Step 1: Create a List of Images

//Replace urls with links to your preferred  images
List<String> imageUrls = [
  'https://example.com/image1.jpg',
  'https://example.com/image2.jpg',
  // Add more image URLs
];

// Step 2: Create a Widget to Display Images with AspectRatio

import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageUrl;

  SquareImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // 1:1 aspect ratio (square)
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, // Cover the square area with the image
      ),
    );
  }
}


// Step 3: Create a Widget to Display Image List

class ImageList extends StatelessWidget {
  final List<String> imageUrls;

  ImageList({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return SquareImage(imageUrl: imageUrls[index]);
      },
    );
  }
}


// Step 4: Implement the Main App

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Square Images'),
        ),
        body: ImageList(imageUrls: imageUrls),
      ),
    );
  }
}
