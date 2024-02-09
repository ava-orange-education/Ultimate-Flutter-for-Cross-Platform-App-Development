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
          title: const Text('Quick Access'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              const SizedBox(width: 20),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              const SizedBox(width: 20),
              Container(
                width: 100,
                height: 100,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
