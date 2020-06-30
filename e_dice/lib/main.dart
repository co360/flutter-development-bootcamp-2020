import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("E-Dice"),
          backgroundColor: Colors.red,
        ),
        body: DicePage()
      ),
    )
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  var leftDiceNumber = 1;
  var rightDiceNumber = 5;

  void RollDice()
  {
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    RollDice();
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FlatButton(
                  onPressed: (){
                    setState(() {
                      RollDice();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')
              ),
            ),
          )
        ],
      ),
    );
  }
}
