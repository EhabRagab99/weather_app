import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

const emojiRegex =
    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

bool checkPasswordSymbols(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

String? validatePassword(
    {required String value,
      required BuildContext context,
      String? confirmPassword,
      bool? isConfirmed}) {
  if (value.isEmpty) {
    if (confirmPassword != null) {
      if (value != confirmPassword) {
        return "confirmationPasswordMustBeTheSame".tr;
      }
    }
    if (isConfirmed != null) {
      if (isConfirmed) {
        return AppLocalizations.of(context)!
            .translate('ConfirmationPasswordEmpty')
            .toString();
      }
    }

    return AppLocalizations.of(context)!.translate('passwordEmpty').toString();
  } else if (value.length < 8) {
    return AppLocalizations.of(context)!
        .translate('passwordMust8Characters')
        .toString();
  } else if (!checkPasswordSymbols(value)) {
    return AppLocalizations.of(context)!
        .translate('passwordNotSymbols')
        .toString();
  }

  return null;
}

String? validateConfirmPassword(
    {required String value1,
      required String value2,
      required BuildContext context}) {
  if (value1.isEmpty) {
    return AppLocalizations.of(context)!.translate('passwordEmpty').toString();
  } else if (value1 != value2) {
    return AppLocalizations.of(context)!
        .translate('passwordsNotMatched')
        .toString();
  } else {
    return null;
  }
}

String replaceEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}

String getArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }
  return input;
}

bool checkTextEnglish(String text) {
  if (RegExp("[a-z]").hasMatch(text.toString())) {
    return true;
  }
  return false;
}

String? validateEmojiUserName(String value) {
  if (value.contains(emojiRegex)) {
    value = value.replaceAll(emojiRegex, '');
  }
  return value;
}

String? validateFirstName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return AppLocalizations.of(context)!
        .translate('firstNameRequired')
        .toString();
  } else if (validateEmojiUserName(value).toString().trim().length < 3) {
    return AppLocalizations.of(context)!.translate('validateName').toString();
  }
  return null;
}

String? validateLastName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return AppLocalizations.of(context)!.translate('lastNameRequired').toString();
  } else if (validateEmojiUserName(value).toString().trim().length < 3) {
    return AppLocalizations.of(context)!.translate('validateName').toString();
  }
  return null;
}

String? validateOrganizationName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return AppLocalizations.of(context)!.translate('organizationNameRequired').toString();
  } else if (validateEmojiUserName(value).toString().trim().length < 3) {
    return AppLocalizations.of(context)!.translate('organizationNameNotReal').toString();
  }
  return null;
}

String? validateReviewName(
    {required String value, required BuildContext context}) {
  if (validateEmojiUserName(value).toString().trim().isEmpty) {
    return AppLocalizations.of(context)!.translate('fieldRequired').toString();
  }
  // else if (validateEmojiUserName(value).toString().trim().length < 3) {
  //   return AppLocalizations.of(context)!
  //       .translate('organizationNameNotReal')
  //       .toString();
  // }
  return null;
}

bool isNumericUsingRegularExpression(String string) {
  final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
  return numericRegex.hasMatch(string);
}

String avatarFirstLastName({required String value}) {
  return value
      .trim()
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((s) => s[0])
      .take(2)
      .join();
}



String getChatFileNameToView({required String fileName}) {
  String name = fileName.split("/").last.replaceAll(" ", "-");
  if (name.length > 10) {
    name = fileName.split("/").last.replaceAll(" ", "-");
    name =
    "${name.substring(0, 10)}${name.length > 14 ? "." : ""}${name.split(".").last}";
  } else {
    name = fileName.split("/").last.replaceAll(" ", "-");
  }
  return name;
}

String getChatImgeNameToView({required String imageName}) {
  String name = imageName.split("/").last.replaceAll(" ", "-");
  if (name.length > 20) {
    name = imageName.split("/").last.replaceAll(" ", "-");
    name =
    "${name.substring(0, 20)}${name.length > 14 ? "." : ""}${name.split(".").last}";
  } else {
    name = imageName.split("/").last.replaceAll(" ", "-");
  }
  return name;
}

String processExpDateInput(String input) {
  if (input.isEmpty) {
    return input;
  }

  RegExp regex = RegExp(r"(^|\s)(1[3-9]|[2-9]\d+)\b");
  String modifiedInput = input.replaceFirst(regex, "01/");
  return modifiedInput;
}

String trimWhitespace(String input) {
  return input.replaceAll(RegExp(r'\s+'), ' ');
}

String productCountTitle(int productCount) {
  if(productCount==1&&SharedPref.getCurrentLang()=="en"){
    return "$productCount ${"product".tr}";
  }
  else if(productCount>1&&SharedPref.getCurrentLang()=="en"){
    return "$productCount ${"products".tr}";

  }
  else if(productCount==1||productCount==2||productCount>10){
    return "$productCount ${"product".tr}";
  }
  else{
    return "$productCount ${"products".tr}";

  }
}
