import 'dart:developer';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static get formatter =>
      DateFormat('MMM dd, yyyy', SharedPref.getCurrentLang());
  static get formatterCustom =>
      DateFormat('yyyy MMM dd', SharedPref.getCurrentLang());
  static get formatterCustom2 =>
      DateFormat('dd MMM yyyy', SharedPref.getCurrentLang());
  static get dayMonthFormat =>
      DateFormat('dd MMM', SharedPref.getCurrentLang());
  static get formatterCustom3 =>
      DateFormat('dd/MM/yyyy', SharedPref.getCurrentLang());
  static get formatterCustom4 =>
      DateFormat('d-M-yyyy', SharedPref.getCurrentLang());
  static get formatterCustomForApi =>
      DateFormat('dd/MM/yyyy', SharedPref.getCurrentLang());
  static get formatterCustomTime =>
      DateFormat('h:m a', SharedPref.getCurrentLang());
  static get formatterCustomDay =>
      DateFormat('EEEE', SharedPref.getCurrentLang());
  static get formatterCustomDayNum =>
      DateFormat('dd', SharedPref.getCurrentLang());
  static get formatterCustomMonthName =>
      DateFormat('MMMM', SharedPref.getCurrentLang());
  static String convertAndFormatTime(String timeString) {
    final arabicAmPmPattern = RegExp(r'(\d{1,2}):(\d{2})\s*([ص|م])');
    final match = arabicAmPmPattern.firstMatch(timeString.trim());

    if (match != null) {
      final hour = int.parse(match.group(1)!);
      final minute = int.parse(match.group(2)!);
      final period = match.group(3);

      // Convert Arabic period indicators to AM/PM
      String periodEnglish;
      if (period == 'ص') {
        periodEnglish = 'AM';
      } else if (period == 'م') {
        periodEnglish = 'PM';
      } else {
        throw FormatException("Invalid period format");
      }

      // Create a DateTime object
      int hour24 = hour;
      if (periodEnglish == 'PM' && hour != 12) {
        hour24 = hour + 12;
      } else if (periodEnglish == 'AM' && hour == 12) {
        hour24 = 0;
      }

      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, hour24, minute);

      // Format the DateTime object to a string
      final format = DateFormat('hh:mm a'); // Format as 'hh:mm AM/PM'
      return format.format(dt).toUpperCase(); // Convert to lowercase
    } else {
      throw const FormatException("Invalid time string format");
    }
  }
  // static Future<TimeOfDay?>? pickTime(context) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: ColorConfig().primaryColor(1),
  //             onPrimary: ColorConfig().whiteColor(1),
  //             onSurface: ColorConfig().blackColor(1),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (pickedTime != null) {
  //     print("vvvvvmmmmmmm${pickedTime}");
  //
  //     return pickedTime;
  //   }
  //   return null;
  // }
  static Future<String?> pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConfig().primaryColor(1),
              onPrimary: ColorConfig().whiteColor(1),
              onSurface: ColorConfig().blackColor(1),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      ));
      log("Selected time ya pop: $formattedTime");
      return formattedTime;
    }
    return null;
  }

  static Future <DateTime?> pickDate({required BuildContext context, bool? isStartDate, DateTime? startDate,bool required = false}) async {
    final DateTime? picked = await showDatePicker(

      context: context,
      initialDate:isStartDate==true?DateTime.now(): startDate??DateTime.now(),
      firstDate:isStartDate==true?DateTime.now(): startDate??DateTime.now(),
      lastDate:  DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConfig().primaryColor(1),
              onPrimary: ColorConfig().whiteColor(1),
              onSurface: ColorConfig().blackColor(1),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      return picked;
    }
    return required?DateTime.now(): null;
  }
  static Future <DateTime?> pickMonthDate({required BuildContext context, bool? isStartDate, DateTime? startDate,bool required = false}) async {

    /// todo: replace with a new one
    // final DateTime? picked = await  showMonthPicker(
    //   context: context,
    //   initialDate:isStartDate==true?DateTime.now(): startDate??DateTime.now(),
    //   firstDate:isStartDate==true?DateTime.now(): startDate??DateTime.now(),
    //   lastDate:  DateTime(2030),
    // );

    /// todo: replace with a new one
    // if (picked != null) {
    //   return picked;
    // }
    /// todo: replace with a new one
    return required?DateTime.now(): null;
  }


  static String getTimeZone(DateTime dateTime) =>
      DateFormat.jm().format(dateTime);

  static String? convertTimeTo12Hours(String? timeString) {
    if (timeString == null) return null;

    try {
      final DateFormat format = DateFormat('H:mm:ss');
      final DateTime dateTime = format.parse(timeString);
      final String formattedTime = DateFormat('h:mm a').format(dateTime);
      return formattedTime;
    } catch (e) {
      return null; // Return null for invalid input
    }
  }
}
