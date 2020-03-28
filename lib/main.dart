import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

//Stateful needs two classes for regenerating
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'what\'s your favorite food?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
      ]
    },
    {
      'questionText': 'what kind of movies do you like the most?',
      'answers': [
        {'text': 'Comedy', 'score': 4},
        {'text': 'Action', 'score': 7},
        {'text': 'Horror', 'score': 10},
        {'text': 'Romance', 'score': 1},
      ]
    },
    {
      'questionText': 'whats your favorite programing languae',
      'answers': [
        {'text': 'HTML', 'score': 15},
        {'text': 'C#', 'score': 7},
        {'text': 'PHP', 'score': 10},
        {'text': 'dart', 'score': 1},
      ]
    },
  ];
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length)
      print('we \'ve more questions');
    else
      print('no more questions');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        // list of widgets
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
