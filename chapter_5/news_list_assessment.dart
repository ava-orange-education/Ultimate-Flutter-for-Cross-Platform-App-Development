// news.dart

class Article {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;
  final String content;

  Article({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      sourceName: json['source']['name'],
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}


// news_list.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'lagosstore.dart';
import 'news.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  Future<List<Article>> fetchNews() async {
    final apiKey = 'YOUR_API_KEY_HERE';
       //Replace `'YOUR_API_KEY_HERE'` with the actual API key you received from News API.

    final apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';    
    final response = await http.get(
      Uri.parse(apiUrl), // Replace with your API URL
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesData = data['articles'];

      List<Article> articles = articlesData.map((articleData) {
        return Article.fromJson(articleData);
      }).toList();

      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: const [
          ThemeManagerWidget(), //Implement the light and dark theme created in the previous chapter
        ],
      ),
      body: FutureBuilder<List<Article>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final newsList = snapshot.data;

            return ListView.builder(
              itemCount: newsList?.length,
              itemBuilder: (context, index) {
                final news = newsList?[index];
                log(news!.imageUrl);
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: news.imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(news.title),
                  subtitle: Text(news.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// main.dart

import 'package:flutter/material.dart';
import 'news_list_assessment.dart';

void main() {
  runApp(MyApp());
}

class ThemeManager {
  static void setThemeMode(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const NewsList(),
    );
  }
}
