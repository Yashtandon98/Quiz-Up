import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answerbut.dart';
import '../UI/question_text.dart';
import '../UI/cwoverlay.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question('Pizza is healthy', false),
    new Question('You are a human', true),
    new Question('Elon Musk is human', false),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlaySwitch = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAns(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlaySwitch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // main page
          children: <Widget>[
            new AnswerButton(true, () => handleAns(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAns(false)),
          ],
        ),
        overlaySwitch == true ? new CWOverlay(
          isCorrect, 
          () {
            if(quiz.length == questionNumber) {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)));
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlaySwitch = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}