import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/profile_pic.jpeg"),
              ),
              Text(
                "Your NAME...",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              Container(
                height: 40.0,
                width: 150.0,
                color: Colors.white,
                child: Text("Email")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
//child: Container(
//height: 50.0,
//width: 100.0,
//margin: EdgeInsets.all(20),
//padding: EdgeInsets.all(10),
//color: Colors.deepPurpleAccent,
//child: Text("Hello World"),