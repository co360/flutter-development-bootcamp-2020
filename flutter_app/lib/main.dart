import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am RICH.!.'),
          backgroundColor: Colors.blueGrey[800],
        ),
        backgroundColor: Colors.blueGrey,
        body: Image(
          image: NetworkImage('https://media.sketchfab.com/models/f37c7cb3a78e488089449092b82d9c15/thumbnails/aae2e118bf864836b6ec8fcec5f710f3/1024x576.jpeg'),
        ),
      ),
    ),
  );
}
