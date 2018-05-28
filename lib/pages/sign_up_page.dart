import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/input_field.dart';
import '../utils/authentications.dart';
import '../utils/validations.dart';
import '../ui/rounded_button.dart';
import '../style.dart';
import '../strings.dart';

TextStyle headingStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  State createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  UserData newUser = UserData();
  UserAuth userAuth = UserAuth();
  bool _autovalidate = false;
  Validations _validations = Validations();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnackBar(Strings.fixErrors);
    } else {
      form.save();
      userAuth.createUser(newUser).then((onValue) {
        showInSnackBar(onValue);
        Navigator.of(context).pushNamedAndRemoveUntil(
            Strings.loginRoute, (Route route) => route == null);
      }).catchError((onError) {
        showInSnackBar(onError.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: screenSize.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
                          style: headingStyle,
                        )
                      ],
                    )),
                SizedBox(
                  height: screenSize.height / 2,
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          autovalidate: _autovalidate,
                          child: Column(
                            children: <Widget>[
                              InputField(
                                hintText: Strings.usernameHint,
                                obscureText: false,
                                textInputType: TextInputType.text,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.person_outline,
                                iconColor: Colors.white,
                                bottomMargin: 20.0,
                                validateFunction: _validations.validateName,
                                onSaved: (String name) {
                                  newUser.displayName = name;
                                },
                              ),
                              InputField(
                                  hintText: Strings.emailHint,
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: _validations.validateEmail,
                                  onSaved: (String email) {
                                    newUser.email = email;
                                  }),
                              InputField(
                                  hintText: Strings.passwordHint,
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 40.0,
                                  validateFunction:
                                      _validations.validatePassword,
                                  onSaved: (String password) {
                                    newUser.password = password;
                                  }),
                              RoundedButton(
                                buttonName: Strings.submitBtn,
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 1.0,
                                buttonColor: Colors.amber,
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
