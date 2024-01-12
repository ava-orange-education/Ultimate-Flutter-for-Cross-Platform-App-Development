import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      await getContacts();
    } else {
      // Permission denied, handle accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List App'),
      ),
      body: FutureBuilder(
        future: getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(contact: contacts[index]);
              },
            );
          }
        },
      ),
    );
  }

  Future<void> getContacts() async {
    Iterable<Contact> contactsIterable = await ContactsService.getContacts();
    setState(() {
      contacts = contactsIterable.toList();
    });
  }
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(contact.displayName ?? ''),
        subtitle: Text(contact.phones?.isNotEmpty == true
            ? contact.phones!.first.value!
            : ''),
      ),
    );
  }
}
