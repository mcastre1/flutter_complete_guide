import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final questionText;
  final answers;
  final Function answerQuestion;

  Quiz(this.questionText, this.answers, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Question(questionText),
            ...(answers as List<Map<String, Object>>).map((answer){
              return Answer(() => answerQuestion(answer['score']), answer['text']);
            }).toList(),
          ],
        );
  }
}