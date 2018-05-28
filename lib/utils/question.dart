import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../strings.dart';
import 'package:flutter/foundation.dart';

class Question {
  String questionText;
  String answer1;
  String answer2;
  String uid;

  Question(
      {@required this.questionText,
      @required this.answer1,
      @required this.answer2,
      @required this.uid});
}

class QuestionSubmit {
  static Future<String> submit(Question q) async {
    await Firestore.instance.collection('questions').document().setData({
      Strings.userIdField: q.uid,
      Strings.questionField: q.questionText,
      Strings.answerOneField: q.answer1,
      Strings.answerTwoField: q.answer2
    });
    return Strings.questionSubmitSuccess;
  }
}
