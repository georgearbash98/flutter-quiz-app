import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Stateful needs two classes for regenerating 
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> { 
    var questionIndex = 0;
    void answerQuestion() {
      // Set stare force flutter to re-render (rebuild) the UI 
      if(questionIndex == 1)
        questionIndex=-1;
      setState(() {
        questionIndex++;
      });
      print('answer chosen');
    }
  @override
  Widget build(BuildContext context) {
    var questions = [
      'what\'s your favorite food?',
      'what kind of movies do you like the most?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        // list of widgets
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
