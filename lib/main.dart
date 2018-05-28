import 'package:flutter/material.dart';
import './pages/sign_up_page.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';
import './pages/new_question_page.dart';
import 'strings.dart';

void main() {
  var routes = <String, WidgetBuilder>{
    Strings.signUpRoute: (BuildContext context) => SignUpPage(),
    Strings.loginRoute: (BuildContext context) => LoginPage(),
    Strings.homeRoute: (BuildContext context) => HomePage(),
    Strings.newQuestionRoute: (BuildContext context) => NewQuestionPage(),
  };

  runApp(new MaterialApp(
    home: LoginPage(),
    routes: routes,
  ));
}
