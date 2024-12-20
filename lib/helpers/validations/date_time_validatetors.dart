import 'package:iem_app/helpers/app_localizations.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeValidation {
  static String? adTimeDifference(
      {required String adTime, required BuildContext context}) {
    int dateMints =
        DateTime.now().difference(DateTime.parse(adTime).toLocal()).inMinutes;
    int dateHours =
        DateTime.now().difference(DateTime.parse(adTime).toLocal()).inHours;
    int dateDays =
        DateTime.now().difference(DateTime.parse(adTime).toLocal()).inDays;
    int dateMonth =
        DateTime.now().difference(DateTime.parse(adTime).toLocal()).inDays %
            365 ~/
            30;
    int dateYear =
        DateTime.now().difference(DateTime.parse(adTime).toLocal()).inDays ~/
            365;

    /// NOW
    if (dateMints == 0) {
      return AppLocalizations.of(context)!.translate('now').toString();
    }

    /// 4 days ago
    if (dateDays != 0 && dateDays <= 31) {
      return "${(dateDays != 2) ? dateDays : ''} ${AppLocalizations.of(context)!.translate((dateDays == 1) ? 'day' : (dateDays == 2) ? 'twoDays' : (dateDays > 2 && dateDays <= 10) ? 'days' : 'day').toString()}";
    }

    /// 4 years ago
    if (dateYear != 0) {
      return "${(dateYear != 2) ? dateYear : ''} ${AppLocalizations.of(context)!.translate((dateYear == 1) ? 'year' : (dateYear == 2) ? 'twoYears' : (dateYear > 2 && dateYear <= 10) ? 'years' : 'year').toString()}";
    }

    /// 4 month ago
    if (dateMonth != 0 && dateMonth <= 12) {
      return "${(dateMonth != 2) ? dateMonth : ''} ${AppLocalizations.of(context)!.translate((dateMonth == 1) ? 'month' : (dateMonth == 2) ? 'twoMonths' : (dateMonth > 2 && dateMonth <= 10) ? 'months' : 'month').toString()}";
    }

    /// 4 hours ago
    if (dateHours != 0) {
      return "${(dateHours != 2) ? dateHours : ''} ${AppLocalizations.of(context)!.translate((dateHours == 1) ? 'hour' : (dateHours == 2) ? 'twoHours' : (dateHours > 2 && dateHours <= 10) ? 'hours' : 'hours').toString()}";
    }

    /// 4 minutes ago
    else {
      return "${(dateMints != 2) ? dateMints : ''} ${AppLocalizations.of(context)!.translate((dateMints == 1) ? 'minute' : (dateMints == 2) ? 'twoMinutes' : (dateMints > 2 && dateMints <= 10) ? 'minutes' : 'minute').toString()}";
    }
  }

  static String? birthDateFormat(DateTime date) {
    // final f = DateFormat('yyyy/MM/dd');
    final f = DateFormat('dd/MM/yyyy');

    return f.format(date.toLocal());
  }

  static String? birthDateFormatForApi(DateTime? date) {
    final f = DateFormat('yyyy-MM-dd');
    if (date != null) {
      return f.format(date.toLocal());
    } else {
      return '';
    }
  }

  static String? degreeCompletionDateFormat(DateTime date) {
    final f1 = DateFormat.yMMMM(SharedPref.getCurrentLang());

    // final f = DateFormat('yyyy/MM/dd');
    // final f = DateFormat('MMMM- yyyy');

    return f1.format(date.toLocal());
  }

  static String? monthThreeDateFormat(DateTime date) {
    final f1 = DateFormat.yMMM(SharedPref.getCurrentLang());

    return f1.format(date.toLocal());
  }

  static String? dateWithTime(DateTime date) {
    final f1 = DateFormat.yMMMd(SharedPref.getCurrentLang());
    final f2 = DateFormat.jm(SharedPref.getCurrentLang());
    return "${f1.format(date.toLocal())} ${f2.format(date.toLocal())}";
  }

  static String? birthDateValidator(
      {required String value, required BuildContext context}) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)!
          .translate('dateBirthValidate')
          .toString();
    }
    return null;
  }

  static String yearsFormat(
      {required BuildContext context, required int year}) {
    if (year == 1) {
      return AppLocalizations.of(context)!.translate("year").toString();
    }
    if (year == 2) {
      return AppLocalizations.of(context)!
          .translate("twoYearsWithoutNum")
          .toString();
    }
    if (year > 2 && year < 11) {
      return AppLocalizations.of(context)!.translate("years").toString();
    } else {
      if (AppLocalizations.of(context)!.locale.languageCode == "ar") {
        return AppLocalizations.of(context)!.translate("year").toString();
      } else {
        return AppLocalizations.of(context)!.translate("years").toString();
      }
    }
  }

  static bool checkTimeClickLimitEnd({required String startDate}) {
    if (DateTime.now().difference(DateTime.parse(startDate)).inMinutes >= 5) {
      return true;
    }

    return false;
  }

  static String messageFormat(DateTime date) {
    final f1 = DateFormat.jm(SharedPref.getCurrentLang());

    return f1.format(date.toLocal());
  }
}
