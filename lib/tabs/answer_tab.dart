import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decision_made/utils/question.dart';
import 'package:flutter/material.dart';

import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/points_overlay.dart';
import '../pages/score_page.dart';
import '../strings.dart';

class AnswerTab extends StatefulWidget {
  @override
  State createState() => AnswerTabState();
}

class AnswerTabState extends State<AnswerTab> {
  Question curQuestion;
  Quiz quiz;
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;
  List<Question> questions = List<Question>();

  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection(Strings.questionsCollection)
        .getDocuments()
        .then((snap) {
      onQuestionsRetrieved(snap.documents);
    });
  }

  void onQuestionsRetrieved(List<DocumentSnapshot> documents) {
    List<Question> questions = List();
    documents.forEach((document) {
      Map<String, dynamic> data = document.data;
      questions.add(Question(
          questionText: data[Strings.questionField],
          answer1: data[Strings.answerOneField],
          answer2: data[Strings.answerTwoField],
          uid: data[Strings.userIdField]));
    });

    this.setState(() {
      quiz = Quiz(questions);
      curQuestion = quiz.nextQuestion;
      questionText = curQuestion.questionText;
      questionNumber = quiz.questionNumber;
    });
  }

  void handleAnswer(bool answer) {
    // TODO: this lol
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          quiz != null && quiz.length > 0
              ? Column(
                  children: <Widget>[
                    AnswerButton(true, () => handleAnswer(true)),
                    QuestionText(questionText, questionNumber),
                    AnswerButton(false, () => handleAnswer(false)),
                  ],
                )
              : Container(),
          overlayVisible == true
              ? PointsOverlay(true, 50, () {
                  if (quiz.length == questionNumber) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ScorePage(quiz.score, quiz.length)),
                        (Route route) => route == null);
                    return;
                  }
                  curQuestion = quiz.nextQuestion;
                  this.setState(() {
                    overlayVisible = false;
                    questionText = curQuestion.questionText;
                    questionNumber = quiz.questionNumber;
                  });
                })
              : Container(),
        ],
      ),
    );
  }
}
