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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: const Center(child: Text('Product 1')),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.green,
              child: const Center(child: Text('Product 2')),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.orange,
              child: const Center(child: Text('Product 3')),
            ),
          ],
        ),
      ),
    );
  }
}
