import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  var _questionIndex = 0;
  var questions = [
    {
      'questionText': "What\'s your favorite color?", 
      'answers':['Black','Red','Blue','Orange','Green'],
    },
    {
      'questionText': "What\'s your favorite animal?", 
      'answers':['Cat','Dog','Rabbit','Tiger','Lion'],
    },
    {
      'questionText': "What\'s your favorite instructor?", 
      'answers':['Max','Ben','Lily','Mordecai','Rigby'],
    },
  ];

  void _questionAnswered() {
    setState(() {
      _questionIndex++;
    });
      
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: 
          Center(
            child: Text("My First Quiz App"),
          )
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) { // Los 3 puntos (...) permiten acceder a los elementos de la lista extraerlos
              return Answer(_questionAnswered, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}