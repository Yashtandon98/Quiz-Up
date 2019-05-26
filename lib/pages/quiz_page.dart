import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answerbut.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( // main page
          children: <Widget>[
            new AnswerButton(true, () {print('You Answered true');}),
            new QuestionText("Pizza is nice", 1),
            new AnswerButton(false, () {print('You Answered false');}),
          ],
        ),
      ],
    );
  }
}