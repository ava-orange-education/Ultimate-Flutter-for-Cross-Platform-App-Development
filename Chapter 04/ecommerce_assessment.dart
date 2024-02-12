//main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';

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
      title: 'Lagos Store',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const CatalogPage(),
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lagos Store'),
        actions: const [
          ThemeManagerWidget(),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price; // Add the price field

  Product({required this.name, required this.imageUrl, required this.price});
}

final List<Product> products = [
  Product(name: 'White Garri', imageUrl: 'assets/product1.jpeg', price: 99.99),
  Product(name: 'Smoked Fish', imageUrl: 'assets/product2.jpeg', price: 149.99),
  Product(name: 'Bean Flour', imageUrl: 'assets/product3.jpeg', price: 199.99),
  // Add more products
];

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imageUrl,
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ThemeManagerWidget extends StatelessWidget {
  const ThemeManagerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.brightness_4),
      onPressed: () {
        if (Get.isDarkMode) {
          ThemeManager.setThemeMode(ThemeMode.light);
        } else {
          ThemeManager.setThemeMode(ThemeMode.dark);
        }
      },
    );
  }
}
