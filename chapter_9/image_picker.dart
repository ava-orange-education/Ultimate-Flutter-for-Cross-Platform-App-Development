import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pickedImage != null
                ? Image.file(
                    File(_pickedImage!.path),
                    height: 200.0,
                  )
                : Container(),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);

                setState(() {
                  _pickedImage = image;
                });

                if (_pickedImage != null) {
                  // Do something with the picked image
                  print('Picked Image Path: ${_pickedImage!.path}');
                }
              },
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();
                final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);

                setState(() {
                  _pickedImage = photo;
                });

                if (_pickedImage != null) {
                  // Do something with the captured photo
                  print('Captured Photo Path: ${_pickedImage!.path}');
                }
              },
              child: Text('Capture Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
