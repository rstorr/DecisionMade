import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/validations.dart';
import '../utils/input_field.dart';
import '../ui/rounded_button.dart';
import '../style.dart';
import '../utils/question.dart';
import '../strings.dart';

class NewQuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewQuestionPageState();
}

class NewQuestionPageState extends State<NewQuestionPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Validations validations = Validations();
  String _questionText = "";
  String _answerOne = "";
  String _answerTwo = "";
  bool autovalidate = false;
  BuildContext context;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() async {
    final FormState form = formKey.currentState;
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();

    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar(Strings.fixErrors);
    } else {
      form.save();
      QuestionSubmit
          .submit(Question(
              uid: user.uid,
              questionText: _questionText,
              answer1: _answerOne,
              answer2: _answerTwo))
          .then((onValue) {
        if (onValue == Strings.questionSubmitSuccess)
          Navigator.pushNamed(context, Strings.homeRoute);
        else
          showInSnackBar(onValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    return Material(
        color: Colors.greenAccent,
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Form(
                key: formKey,
                autovalidate: autovalidate,
                child: Column(
                  children: <Widget>[
                    InputField(
                      hintText: Strings.questionHint,
                      obscureText: false,
                      textInputType: TextInputType.multiline,
                      textStyle: textStyle,
                      textFieldColor: textFieldColor,
                      icon: Icons.mail_outline,
                      iconColor: Colors.white,
                      bottomMargin: 20.0,
                      // validateFunction: validations.validateEmail,
                      onSaved: (String s) => _questionText = s,
                    ),
                    InputField(
                      hintText: Strings.answerOneHint,
                      obscureText: false,
                      textInputType: TextInputType.multiline,
                      textStyle: textStyle,
                      textFieldColor: textFieldColor,
                      icon: Icons.lock_open,
                      iconColor: Colors.white,
                      bottomMargin: 30.0,
                      // validateFunction: validations.validatePassword,
                      onSaved: (String s) => _answerOne = s,
                    ),
                    InputField(
                      hintText: Strings.answerTwoHint,
                      obscureText: false,
                      textInputType: TextInputType.multiline,
                      textStyle: textStyle,
                      textFieldColor: textFieldColor,
                      icon: Icons.lock_open,
                      iconColor: Colors.white,
                      bottomMargin: 30.0,
                      // validateFunction: validations.validatePassword,
                      onSaved: (String s) => _answerTwo = s,
                    ),
                    RoundedButton(
                      buttonName: Strings.submitBtn,
                      onTap: _handleSubmitted,
                      width: screenSize.width,
                      height: 50.0,
                      bottomMargin: 10.0,
                      borderWidth: 0.0,
                      buttonColor: Colors.amber,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
