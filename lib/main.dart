import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

//void main(){
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // _ underscore, makes it from a public into a private class
  var _questionIndex = 0;

  var _totalScore = 0;

  static const questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Black', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Elephant', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Miguel', 'score': 5},
        {'text': 'Robert', 'score': 3},
        {'text': 'Hugo', 'score': 1}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      //This is where you place all the things that will get changed when clicking on something.
      _questionIndex += 1;
      print("Answer chosen");
      print(_questionIndex);
    });

    print(_totalScore);
  }

  void _resetQuiz(){
    _totalScore = 0;

    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: _questionIndex < questions.length
                ? Quiz(questions[_questionIndex]['questionText'],
                    questions[_questionIndex]['answers'], _answerQuestion)
                : Result(_totalScore, _resetQuiz)));
  }
}
