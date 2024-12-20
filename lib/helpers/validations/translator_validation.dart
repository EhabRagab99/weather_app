// import 'package:flutter/material.dart';
//
// class TranslatorValidation{
//   final translator = GoogleTranslator();
//
//
//   Future <String> doTranslate({required BuildContext context,required String text,required String languageKey,})async{
//
//     String value="";
//
//     if(text.trim().isNotEmpty){
//       if(languageKey=="en"){
//         await translator.translate(text, from: 'ar', to: 'en').then((en)async {
//           value=en.toString();
//           debugPrint(value);
//         });
//       }
//       else if (languageKey=="ar"){
//         await translator.translate(text, from: 'en', to: 'ar').then((ar)async {
//           value=ar.toString();
//           debugPrint(value);
//         });
//       }
//     }
//
//     return value;
//   }
//
//
//
// }