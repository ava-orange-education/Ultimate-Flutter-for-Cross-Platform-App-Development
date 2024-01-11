class MyStatelessWidget extends StatelessWidget {
  // Properties, such as text and color, can be passed as parameters
  final String text;
  final Color color;

  // Constructor to initialize the properties
  MyStatelessWidget({required this.text, required this.color});

  // The build method defines the widget's appearance
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Text(text),
    );
  }
}
