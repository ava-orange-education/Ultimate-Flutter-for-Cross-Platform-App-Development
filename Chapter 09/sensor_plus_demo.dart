import 'package:sensors_plus/sensors_plus.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: AccelerometerDemo(),
    );
  }
}

class AccelerometerDemo extends StatefulWidget { 

  const AccelerometerDemo({super.key}); 
  @override 

  _AccelerometerDemoState createState() => _AccelerometerDemoState(); 
} 


class _AccelerometerDemoState extends State<AccelerometerDemo> {
  // List to store accelerometer data
  List<AccelerometerEvent> _accelerometerValues = [];

  // StreamSubscription for accelerometer events
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();

    // Subscribe to accelerometer events
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        // Update the _accelerometerValues list with the latest event
        _accelerometerValues = [event];
      });
    });
  }

  // ... (Other methods)

  @override
  void dispose() {
    // Cancel the accelerometer event subscription to prevent memory leaks
    _accelerometerSubscription.cancel();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Accelerometer Demo),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Accelerometer Data:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          if (_accelerometerValues.isNotEmpty)
            Text(
              'X: ${_accelerometerValues[0].x.toStringAsFixed(2)}, '
              'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)}, '
              'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            )
          else
            Text('No data available', style: TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );
}
}

