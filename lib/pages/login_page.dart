import 'package:flutter/material.dart';
import '../utils/validations.dart';
import '../utils/authentications.dart';
import '../utils/input_field.dart';
import '../ui/rounded_button.dart';
import '../ui/text_button.dart';
import '../style.dart';
import '../strings.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  UserData user = UserData();
  UserAuth userAuth = UserAuth();
  bool autovalidate = false;
  Validations validations = Validations();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar(Strings.fixErrors);
    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == Strings.loginSuccess)
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
    Validations validations = Validations();
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenSize.height / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Image(
                          image: ExactAssetImage('lib/images/logo.png'),
                          width: (screenSize.width < 500)
                              ? 120.0
                              : (screenSize.width / 4) + 12.0,
                          height: screenSize.height / 4 + 20,
                        ))
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: formKey,
                          autovalidate: autovalidate,
                          child: Column(
                            children: <Widget>[
                              InputField(
                                  hintText: Strings.emailHint,
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: validations.validateEmail,
                                  onSaved: (String email) {
                                    user.email = email;
                                  }),
                              InputField(
                                  hintText: Strings.passwordHint,
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                      validations.validatePassword,
                                  onSaved: (String password) {
                                    user.password = password;
                                  }),
                              RoundedButton(
                                buttonName: Strings.loginBtn,
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: Colors.amber,
                              ),
                              TextButton(
                                buttonName: Strings.createAccountBtn,
                                onPressed: () => Navigator
                                    .of(context)
                                    .pushNamed(Strings.signUpRoute),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
