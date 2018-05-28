class Strings {
  static final String homeRoute = "/HomePage";
  static final String signUpRoute = "/SignUpPage";
  static final String loginRoute = "/LoginPage";
  static final String newQuestionRoute = "/NewQuestionPage";

  static final String appName = "Decision Made";

  static final String answerTab = "Answer";
  static final String askTab = "Ask";

  // Tool tips.
  static final String profileTT = "My Profile";
  static final String newQuestionTT = "New Question";

  // Messages
  static final String fixErrors =
      "Please fix the errors in red before submitting.";
  static final String questionSubmitSuccess =
      "Question submitted successfully.";
  static final String nameRequired = "Name is required.";
  static final String emailRequired = "Email is required.";
  static final String nameRegex = r"^[A-za-z ]+$";
  static final String emailRegex =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  static final String emailInvalid = 'Invalid email address';
  static final String choosePwd = "Please choose a password.";
  static final String alphabeticalOnly =
      'Please enter only alphabetical characters.';
  static final String loginSuccess = "Login successful.";

  // Hints.
  static final String questionHint = "Question";
  static final String answerOneHint = "Answer 1";
  static final String answerTwoHint = "Answer 2";
  static final String usernameHint = "Username";
  static final String passwordHint = "Password";
  static final String emailHint = "Email";

  // Buttons.
  static final String submitBtn = "Submit";
  static final String loginBtn = "Login";
  static final String createAccountBtn = "Create Account";

  // Firebase Cloudfirestore.
  static final String questionsCollection = "questions";
  static final String questionField = "question_text";
  static final String answerOneField = "answer_one";
  static final String answerTwoField = "answer_two";
  static final String userIdField = "uid";
}
