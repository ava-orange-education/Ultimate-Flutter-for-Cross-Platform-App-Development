// Step 2: Design Clothing Items

class ClothingItem {
  final String name;
  final String imageUrl;
  final double price;

  ClothingItem({required this.name, required this.imageUrl, required this.price});
}

// Step 3: Design the Clothing Page

import 'package:flutter/material.dart';
import 'clothing_item.dart';

class ClothingPage extends StatelessWidget {
  final List<ClothingItem> items;

  const ClothingPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Clothing Store'),
              background: Image.network(
                'https://example.com/store_banner.jpg', // Replace with your store banner image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = items[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  onTap: () {
                    // Implement item click action
                  },
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

// Step 4: Implement the Main App

import 'package:flutter/material.dart';
import 'clothing.dart';
import 'clothing_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      home: ClothingPage(
        items: [
          ClothingItem(name: 'T-Shirt', imageUrl: 'https://reviewed-com-res.cloudinary.com/image/fetch/s--M_iYml0Y--/b_white,c_fill,cs_srgb,f_auto,fl_progressive.strip_profile,g_auto,h_972,q_auto,w_972/https://reviewed-production.s3.amazonaws.com/1686778972972/nike-sneakers-hero.jpg', price: 19.99),
          ClothingItem(name: 'Jeans', imageUrl: 'https://reviewed-com-res.cloudinary.com/image/fetch/s--M_iYml0Y--/b_white,c_fill,cs_srgb,f_auto,fl_progressive.strip_profile,g_auto,h_972,q_auto,w_972/https://reviewed-production.s3.amazonaws.com/1686778972972/nike-sneakers-hero.jpg', price: 39.99),
          // Add more clothing items as needed
        ],
      ),
    );
  }
}
