import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultPhrase = 'You did it!';
    if (resultScore <= 8) {
      resultPhrase = '$resultScore\n You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultPhrase = '$resultScore\n Pretty likeable!';
    } else if (resultScore <= 16) {
      resultPhrase = '$resultScore\n You are ... strange?!';
    } else {
      resultPhrase = '$resultScore\n You are son bad';
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart quiz!'),
            textColor: Colors.teal,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
