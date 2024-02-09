import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Product Catalog'),
          ),
          body: Container(
            width: 200,
            height: 100,
            padding:
                const EdgeInsets.all(16), // Add padding inside the Container
            margin: const EdgeInsets.symmetric(
                vertical: 10), // Add margin around the Container
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10), // Add rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Add a shadow
                ),
              ],
            ),
            child: const Text(
              'Today\'s Temperature: 25°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
