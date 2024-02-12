import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Gmail App'),
          ),
          ListTile(
            title: Text('Inbox'),
            onTap: () {
              Navigator.pop(context); // Close the Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InboxPage()),
              );
            },
          ),
          // Add other mail folders
        ],
      ),
    ),
    body:InboxPage(),
  );
}

}

// Step 3: Create a new file called email_model.dart to represent the email model.

class Email {
  final String sender;
  final String subject;
  final String body;
  bool isFavorite;

  Email({
    required this.sender,
    required this.subject,
    required this.body,
    this.isFavorite = false,
  });
}

// Design the Inbox Page


import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final List<Email> emails = [
    Email(
      sender: 'John Doe',
      subject: 'Meeting Tomorrow',
      body: 'Hey, let\'s discuss the upcoming meeting...',
    ),
    // Add more mock data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(emails[index].subject[0]),
            ),
            title: Text(emails[index].sender),
            subtitle: Text(emails[index].body),
            trailing: IconButton(
              icon: Icon(
                emails[index].isFavorite
                    ? Icons.star
                    : Icons.star_border,
              ),
              onPressed: () {
                // Toggle favorite status
                setState(() {
                  emails[index].isFavorite = !emails[index].isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

