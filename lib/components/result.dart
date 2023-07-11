import 'package:flutter/material.dart';
import 'package:wecare/components/quiz.dart';
import 'package:wecare/components/answer.dart';
import 'package:wecare/components/question.dart';
import 'package:wecare/components/result.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 56 && resultScore >= 36) {
      resultText = "You are highly stressed! Take a break.";
    } else if (resultScore <= 35 && resultScore >= 20) {
      resultText = "You are experiencing mild stress! ";
    } else {
      resultText = "You are stress free!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.greenAccent,
            ),
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
