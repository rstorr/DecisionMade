import '../strings.dart';

class Validations {
  String validateName(String value) {
    if (value.isEmpty) return Strings.nameRequired;
    final RegExp nameExp = RegExp(Strings.nameRegex);
    if (!nameExp.hasMatch(value)) return Strings.alphabeticalOnly;
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return Strings.emailRequired;
    final RegExp emailExp = RegExp(Strings.emailRegex);

    if (!emailExp.hasMatch(value)) return Strings.emailInvalid;
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return Strings.choosePwd;
    return null;
  }
}
