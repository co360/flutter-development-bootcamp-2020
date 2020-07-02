import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int questionNo = 0;
  Icon correctMark (){
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }
  Icon incorrectMark(){
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(questionNo),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quizbrain.getQuestionAnswer(questionNo) == true)
                    scoreKeeper.add(correctMark());
                  else
                    scoreKeeper.add(incorrectMark());
                  if (questionNo < quizbrain.getQuestionBankLength()-1)
                    questionNo+=1;
                  else {
                    Alert(context: context,
                        title: "QUIZ COMPLETED!",
                        desc: "The Quiz is completed. Restarting again.").show();
                    questionNo = 0;
                    scoreKeeper =[];
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quizbrain.getQuestionAnswer(questionNo) == false)
                    scoreKeeper.add(correctMark());
                  else
                    scoreKeeper.add(incorrectMark());
                  if (questionNo < quizbrain.getQuestionBankLength()-1)
                    questionNo+=1;
                  else
                  {
                    Alert(context: context,
                        title: "QUIZ COMPLETED!",
                        desc: "The Quiz is completed. Restarting again.").show();
                    questionNo = 0;
                    scoreKeeper = [];
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
    ]);
  }
}

