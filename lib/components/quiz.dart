import 'package:flutter/material.dart';

import 'package:wecare/components/quiz.dart';
import 'package:wecare/components/answer.dart';
import 'package:wecare/components/question.dart';
import 'package:wecare/components/result.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
      child: Column(
        children: [
          Text(
            'Question ${questionIndex + 1}/${questions.length}',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Question(
            questions[questionIndex]['questionText'] as String,
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['score']),
                answer['text'] as String);
          }).toList(),
        ],
      ),
    );
  }
}
