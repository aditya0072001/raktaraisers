import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raktaraisers/models/doner.dart';
import 'dart:async';
import 'dart:io';

class Give extends StatefulWidget {
  @override
  _GiveState createState() => new _GiveState();
}

class _GiveState extends State<Give> {
  Donor donor;
  final name = TextEditingController();
  File image;
  final picker = ImagePicker();
  final location = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  void dispose() {
    name.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter donor name",
                  labelStyle: TextStyle(color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.white),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: location,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter donor location",
                  labelStyle: TextStyle(color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  fillColor: Colors.white),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                onPressed: getImage,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red[300])),
                child: Text(
                  "Select Image",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              child: Icon(Icons.check_circle, size: 80, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
