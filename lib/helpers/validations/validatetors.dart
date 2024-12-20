import 'package:iem_app/helpers/validations/email_validatetors.dart';
import 'package:iem_app/helpers/validations/my_strings.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

const emojiRegex = '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
class Validators {
  static bool checkPasswordSymbols(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? validatePassword({ required String value, required BuildContext context,String? confirmPassword,bool? isConfirmed}) {

    if(value.isEmpty){
      return ValidationStrings.emptyPasswordValidation;
    }
    else if(!value.isNullOrEmpty){
      if(value.length <8){
        return ValidationStrings.passwordInvValidation;
      }
    }
    else if(isConfirmed==true){
      if(value != confirmPassword){
        return ValidationStrings.passwordNotSameValidation;
      }
    }
    // if(value.isEmpty){
    //   if(confirmPassword!=null){
    //     if(value!=confirmPassword){
    //       return "passwords_not_same".tr;
    //     }
    //   }
    //   if(isConfirmed!=null){
    //     if(isConfirmed){
    //       return 'password_validation'.tr;
    //     }
    //   }
    //
    //   return ValidationStrings.emptyPasswordValidation;
    //
    // }
    // else if(value.length<8){
    //   return 'passwordMust8Characters';
    // }
    // else if(!checkPasswordSymbols(value)){
    //   return 'passwordNotSymbols';
    // }

    return null;
  }

  static String? validateOtp({ required String? value}) {
    if(value?.isEmpty == true){
      return ValidationStrings.emptyOtpValidation;
    }
    else if(value?.isNotEmpty == true){
      if(value!.length <4){
        return ValidationStrings.otpInvValidation;
      }
    }
    return null;
  }

  static String? validateConfirmPassword({ required String value1,required String value2, required BuildContext context}) {
    if(value1.isEmpty){
      return 'passwordEmpty'.tr;
    }
    else if(value1.length<8){
      return 'passwordMust8Characters'.tr;
    }
    else if(!checkPasswordSymbols(value1)){
      return 'passwordNotSymbols'.tr;
    }
    else if(value1!=value2){
      return 'passwordsNotMatched'.tr;
    }

    return null;
  }

  static String replaceEnglishNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }

  static String getArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }


  static bool checkTextEnglish(String text) {
    if( RegExp("[a-z]").hasMatch(text.toString())){
      return true;
    }
    return false;
  }

  static String? validateEmojiUserName(String value) {
    if(value.contains(emojiRegex)){
      value = value.replaceAll(emojiRegex,'');
    }
    return value;
  }

  static String? validateFirstName({ required String value, required BuildContext context}) {
    if(validateEmojiUserName(value).toString().trim().isEmpty){
      return  ValidationStrings.emptyNameValidation;
    }

    else if(validateEmojiUserName(value).toString().trim().length<8){
      return ValidationStrings.nameIsInvalid;
    }
    return null;
  }

  static String? validateLastName({ required String value, required BuildContext context}) {
    if(validateEmojiUserName(value).toString().trim().isEmpty){
      return 'lastNameRequired'.tr;
    }

    else if(validateEmojiUserName(value).toString().trim().length<3){
      return 'validateName'.tr;
    }
    return null;
  }


  static String? validateOrganizationName({ required String value, required BuildContext context}){
    if(validateEmojiUserName(value).toString().trim().isEmpty){
      return 'organizationNameRequired'.tr;
    }

    else if(validateEmojiUserName(value).toString().trim().length<3){
      return 'organizationNameNotReal'.tr;
    }
    return null;
  }

  static bool isNumericUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(string);
  }


  static String avatarFirstLastName({ required String value}) {
    return value.trim().replaceAll(RegExp(' +'), ' ').split(' ').map((s) => s[0]).take(2).join();
  }


  static String? priceViewFormat(String price) {
    String priceWillView=double.parse(replaceEnglishNumber(price.isNotEmpty?price:"0").toString()).toStringAsFixed(2);
    return priceWillView.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.");
  }

  static String getChatFileNameToView({required String fileName}) {
    String name=fileName.split("/").last.replaceAll(" ", "-");
    if(name.length>10){
      name=fileName.split("/").last.replaceAll(" ", "-");
      name="${name.substring(0,10)}${name.length>14?".":""}${name.split(".").last}";
    }
    else{
      name=fileName.split("/").last.replaceAll(" ", "-");
    }
    return name;
  }

  static String getChatImageNameToView({required String imageName}) {
    String name=imageName.split("/").last.replaceAll(" ", "-");
    if(name.length>20){
      name=imageName.split("/").last.replaceAll(" ", "-");
      name="${name.substring(0,20)}${name.length>14?".":""}${name.split(".").last}";
    }
    else{
      name=imageName.split("/").last.replaceAll(" ", "-");
    }
    return name;
  }
  /// PHONE NUMBER

  static String removeZeroFromFirst(String value){
    if (value[0] == '0') {
      value= value.replaceFirst("0", "");
      return value;
    }
    else{
      return value;
    }
  }

  static String? validatePhoneNumber({ required String value,required int length, required BuildContext context}) {
    String phone= value;

    if(phone.isEmpty){
      return ValidationStrings.emptyPhoneValidation;
    }
    else {
      // if (phone[0] == '0') {
      //   phone= value.replaceFirst("0", "");
      // }

      if (phone.length != length ) {
        return ValidationStrings.phoneNumberValidation;
      } else if (startsWithAllowedPattern(value) == false ) {
        return ValidationStrings.phoneNumberValidation;
      }
      else{
        return null;

      }
    }
  }

  static String? validateAffiliateCode(String value) {
    if(value.isEmpty){
      return null;
    }
    else if(value.isNotEmpty){
      if(value.length != 8){
        return ValidationStrings.affiliateInvValidation;
      }
    }
    return null;
  }
  static String? validateComplaintTitle(String value) {
    if(value.isEmpty){
      return ValidationStrings.complaintTitleInvValidation;
    }
    return null;
  }
  static String? validateEmail({required String value, required BuildContext context}) {
    if (value.toString().isEmpty) {
      return "empty_email".tr;
    } else if (!EmailValidation.validateEmailRegExp(
      context: context,
      value: value.toString(),
    )) {
      return "email_inv".tr;
    }
    return null;
  }

  static String? validateComplaintDescription(String value) {
    if(value.isEmpty){
      return ValidationStrings.complaintDescriptionInvValidation;
    }
    return null;
  }
  static String? validatePost(String value) {
    if(value.isEmpty){
      return ValidationStrings.emptyPostValidation;
    }
    return null;
  }
  static String? validateQuestion(String value) {
    if(value.isEmpty){
      return ValidationStrings.emptyQuestionValidation;
    }
    return null;
  }
}



bool startsWithAllowedPattern(String text) {
  // final pattern = r'^(010|011|012|015|0100|0106|0109|0101|0111|0114|0112|0155|0115)';
  const pattern = r'^(010|011|012|015|٠١٠|٠١١|٠١٢|٠١٥)'; // علي ضمانة محمود حسين ولو فيه باج محمود هيتخصم منه نص شهر
  final regex = RegExp(pattern);

  return regex.hasMatch(text);
}