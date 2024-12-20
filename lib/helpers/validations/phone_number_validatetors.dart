import 'package:iem_app/helpers/app_localizations.dart';
import 'package:flutter/material.dart';

class PhoneNumberValidation {
  static String removeZeroFromFirst(String value) {
    if (value[0] == '0') {
      value = value.replaceFirst("0", "");
      return value;
    } else {
      return value;
    }
  }

  static String? validatePhoneNumber(
      {required String value,
      required int length,
      required BuildContext context}) {
    String phone = value;

    if (phone.isEmpty) {
      return AppLocalizations.of(context)!
          .translate('phoneRequired')
          .toString();
    } else {
      if (phone[0] == '0') {
        phone = value.replaceFirst("0", "");
      }

      if (phone.length == length) {
        return null;
      } else {
        return AppLocalizations.of(context)!
            .translate('invalidPhoneNumber')
            .toString();
      }
    }
  }
}
