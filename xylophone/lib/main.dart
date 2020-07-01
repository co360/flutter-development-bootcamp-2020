import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  final player = AudioCache();
  Expanded buildKey(int songNumber, Color color){
    return Expanded(
      child: FlatButton(
        onPressed: (){
          player.play('note$songNumber.wav');
        },
        child: Container(child: Container(color: color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(1, Colors.red),
              buildKey(1, Colors.orange),
              buildKey(1, Colors.yellow),
              buildKey(1, Colors.green),
              buildKey(1, Colors.teal),
              buildKey(1, Colors.blue),
              buildKey(1, Colors.purple),
            ],
            ),
          ),
        ),
      );
  }
}
