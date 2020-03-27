import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  void _answerQuestion() {
    // Set stare force flutter to re-render (rebuild) the UI
    if (_questionIndex == 2) _questionIndex = -1;
    setState(() {
      _questionIndex++;
    });
    print('answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favorite food?',
        'answers': ['Black', 'Green', 'red', 'white']
      },
      {
        'questionText': 'what kind of movies do you like the most?',
        'answers': ['comedy', 'romance', 'action', 'horror']
      },
      {
        'questionText': 'whats your favorite programing languae',
        'answers': ['dart', 'c#', 'node.js', 'php']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        // list of widgets
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText']
              ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
