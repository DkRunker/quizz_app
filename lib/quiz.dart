import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function questionAnswered;

  Quiz(
      {@required this.questions,
      @required this.questionAnswered,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          // Los 3 puntos (...) permiten acceder a los elementos de la lista extraerlos
          return Answer(() => questionAnswered(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
