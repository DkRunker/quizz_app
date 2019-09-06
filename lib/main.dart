import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  var _totalScore = 0;

  final _questions = [
    {
      'questionText': "What\'s your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Blue', 'score': 4},
        {'text': 'Orange', 'score': 3},
        {'text': 'Green', 'score': 1}
      ],
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answers': [
        {'text': 'Cat', 'score': 4},
        {'text': 'Dog', 'score': 2},
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Lion', 'score': 6}
      ],
    },
    {
      'questionText': "What\'s your favorite instructor?",
      'answers': [
        {'text': 'Max', 'score': 3},
        {'text': 'Ben', 'score': 3},
        {'text': 'Lilly', 'score': 4},
        {'text': 'Mordecai', 'score': 6},
        {'text': 'Rigby', 'score': 8}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswered(int score) {
    _totalScore += score;

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
            title: Center(
          child: Text("My First Quiz App"),
        )),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                questionAnswered: _questionAnswered)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
