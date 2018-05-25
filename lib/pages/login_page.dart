import 'package:flutter/material.dart';
import '../utils/validations.dart';
import '../utils/authentications.dart';
import '../utils/input_field.dart';
import '../ui/rounded_button.dart';
import '../ui/text_button.dart';

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

  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == "Login Successfull")
          Navigator.pushNamed(context, "/HomePage");
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
                                  hintText: "Email",
                                  obscureText: false,
                                  textInputType: TextInputType.text,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: validations.validateEmail,
                                  onSaved: (String email) {
                                    user.email = email;
                                  }),
                              InputField(
                                  hintText: "Password",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                      validations.validatePassword,
                                  onSaved: (String password) {
                                    user.password = password;
                                  }),
                              RoundedButton(
                                buttonName: "Get Started",
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              buttonName: "Create Account",
                              onPressed: () => onPressed("/SignUp"),
                            ),
                            TextButton(
                              buttonName: "Need Help?",
                              onPressed: _onPressed,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
