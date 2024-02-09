class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Properties that can change over time
  bool isActive = false;

  // Method to update the state
  void toggleActive() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleActive,
      child: Text(isActive ? 'Active' : 'Inactive'),
    );
  }
}
