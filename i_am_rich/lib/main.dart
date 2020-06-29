import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am RICH!!'),
          backgroundColor: Colors.blueGrey
        ),
        backgroundColor: Colors.black12,
        body: Center(
            child: Image(image: AssetImage('images/diamond_image.png'),
          )
        ),
      ),
    ),
  );
}


