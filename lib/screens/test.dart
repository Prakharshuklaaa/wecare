import 'package:flutter/material.dart';
import 'package:wecare/components/quiz.dart';
import 'package:wecare/components/answer.dart';
import 'package:wecare/components/question.dart';
import 'package:wecare/components/result.dart';

class test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return testState();
  }
}

class testState extends State<test> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var _questions = const [
    {
      'questionText': 'Were you ever evaluated clinically for stress?',
      'answers': [
        {'text': 'Yes', 'score': 5},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Relationship problems?',
      'answers': [
        {'text': 'Yes', 'score': 5},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Trouble with parents?',
      'answers': [
        {'text': 'Yes', 'score': 4},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Lower grades than expected?',
      'answers': [
        {'text': 'Yes', 'score': 3},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
          'Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
      'answers': [
        {'text': 'Fairly Often', 'score': 4},
        {'text': 'Very Often', 'score': 3},
        {'text': 'Sometimes', 'score': 2},
        {'text': 'Almost Never', 'score': 1},
      ],
    },
    {
      'questionText':
          'I have been upset very often due to something that happened unexpectedly',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 1},
        {'text': 'Disagree', 'score': 2},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 4},
        {'text': 'Strongly Agree', 'score': 5},
      ],
    },
    {
      'questionText':
          'I often feel that I\'m unable to control important things in my life',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 1},
        {'text': 'Disagree', 'score': 2},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 4},
        {'text': 'Strongly Agree', 'score': 5},
      ],
    },
    {
      'questionText': 'I often feel stressed out and nervous',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 1},
        {'text': 'Disagree', 'score': 2},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 4},
        {'text': 'Strongly Agree', 'score': 5},
      ],
    },
    {
      'questionText':
          'I often feel confident about my ability to handle my personal problems',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 5},
        {'text': 'Disagree', 'score': 4},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 2},
        {'text': 'Strongly Agree', 'score': 1},
      ],
    },
    {
      'questionText':
          'I often feel confident about my ability to handle my personal problems',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 5},
        {'text': 'Disagree', 'score': 4},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 2},
        {'text': 'Strongly Agree', 'score': 1},
      ],
    },
    {
      'questionText': 'I often feel that I am on top of things',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 5},
        {'text': 'Disagree', 'score': 4},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 2},
        {'text': 'Strongly Agree', 'score': 1},
      ],
    },
    {
      'questionText':
          'I often feel that I\'m being watched by others and they\'re gossiping about me',
      'answers': [
        {'text': 'Strongly Disagree', 'score': 1},
        {'text': 'Disagree', 'score': 2},
        {'text': 'Neutral', 'score': 3},
        {'text': 'Agree', 'score': 4},
        {'text': 'Strongly Agree', 'score': 5},
      ],
    },
  ];

  void _answerQuestion(int score) {
    //wrapping in a set state function
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            'Stress Calculator',
            textAlign: TextAlign.center,
          ),
        ),
        body: _questionIndex <= _questions.length - 1
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
