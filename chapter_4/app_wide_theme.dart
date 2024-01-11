void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 34, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
      ),
    ),
    home: LoginScreen(),
  ));
}
