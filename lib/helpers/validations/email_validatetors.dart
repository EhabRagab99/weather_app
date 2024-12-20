import 'package:iem_app/helpers/app_localizations.dart';
import 'package:flutter/material.dart';

class EmailValidation {
  static bool validateEmailRegExp(
      {required String value, required BuildContext context}) {
    // This is just a regular expression for email addresses
    var p = "[a-zA-Z0-9+._%-+]{1,256}"
        """
\\@"""
        """
[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"""
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+";
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return true;
    } else {
      debugPrint('Email is not valid');

      return false;
    }
  }

  static String? validateEmail(
      {required String value, required BuildContext context}) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.translate('emailEmpty').toString();
    } else if (!validateEmailRegExp(
      context: context,
      value: value.toString(),
    )) {
      return AppLocalizations.of(context)!.translate('emailNotValid').toString();
    }
    return null;
  }

  static List<String> extractEmailsFromString(String string) {
    final emailPattern = RegExp(r'\b[\w.-]+@[\w.-]+\.\w{2,4}\b',
        caseSensitive: false, multiLine: true);
    final matches = emailPattern.allMatches(string);
    final List<String> emails = [];
    for (final Match match in matches) {
      emails.add(string.substring(match.start, match.end));
    }

    return emails;
  }

  static bool checkTextHaveEmail(String string) {
    final emails = extractEmailsFromString(string);

    return emails.isNotEmpty;
  }

  static bool containsNumber(String value) {
    final regex = RegExp(r'\d');
    return regex.hasMatch(value);
  }

  static bool containsSpecialChar(String value) {
    final regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return regex.hasMatch(value);
  }

  static bool containsUpperCaseLowerCase(String value) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])');
    return regex.hasMatch(value);
  }
}
