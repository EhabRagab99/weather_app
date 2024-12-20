import 'dart:io';

import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/show_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

extension AddTHToDate on DateFormat{

  String formatTh(DateTime date) {
    int dayNum = date.day;
    if(!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }
    String datTh = "";
    if(dayNum >= 11 && dayNum <= 13) datTh = 'th';
    switch(dayNum % 10) {
      case 1: datTh = 'st';break;
      case 2: datTh = 'nd';break;
      case 3: datTh = 'rd';break;
      default: datTh = 'th';break;
    }
    return format(date).replaceAll(",","$datTh,");
  }
}
extension ToHexColor on Color {
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}


extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension OnTapImageExtension on Image {
  Widget showOnTap(BuildContext context){
    return InkWell(
      onTap: (){
        customPushNavigator(
         context,
          ShowImagesWidget(
            images: const [],
            image: image,
          ),
        );
      },
      child: this,
    );
  }
}
// extension OnTapFadeImageExtension on FadeInImage {
//   Widget showOnTap(){
//     return InkWell(
//       onTap: (){
//         Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
//           images: const [],
//           image: image,
//         )));
//       },
//       child: this,
//     );
//   }
// }
// ignore: camel_case_extensio



class Helper{
  static final apiFormatter = DateFormat('MM/dd/yyyy',SharedPref.getCurrentLang()??'en');
  static final normalFormatter = DateFormat('dd/MM/yyyy',SharedPref.getCurrentLang()??'en');
  static final formatter = DateFormat('MMM dd, yyyy',SharedPref.getCurrentLang()??'en');
  static final formatterCustomMonthName = DateFormat('MMMM',SharedPref.getCurrentLang()??'en');

  static final formatterCustom = DateFormat('yyyy MMM dd',SharedPref.getCurrentLang()??'en');
  static get formatterCustom2 => DateFormat('dd MMM yyyy',SharedPref.getCurrentLang()??'en');
  // static final formatterCustom3 = DateFormat('dd / MM / yyyy',SharedPref.getCurrentLang()??'en');
  static final formatterCustomDayNum = DateFormat('dd',SharedPref.getCurrentLang()??'en');
  static final formatterCustomDateTime = DateFormat('yMMMEd',SharedPref.getCurrentLang()??'en');
  static final formatterCustomMonthYear = DateFormat('yMMM',SharedPref.getCurrentLang()??'en');
  static final formatterCustomForApi = DateFormat('dd/MM/yyyy',SharedPref.getCurrentLang()??'en');
  static final formatterCustomTime = DateFormat('hh:mm a',SharedPref.getCurrentLang()??'en');
  static final formatterCustomDay = DateFormat('EEEE',SharedPref.getCurrentLang()??'en' );
  static String  getTimeZone(DateTime dateTime) =>DateFormat.jm().format(dateTime);
  static const String imagePlaceHolder =
      "https://cdn-icons-png.flaticon.com/512/147/147140.png";
  static const String defaultNetworkImage =
      "https://leverageedublog.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2019/11/23172210/List-of-Courses-after-10th-Standard.jpg";
  static String shortName(String name){
    List<String> names=name.trim().split(" ");
    return names.map((e) => e[0]).join();

  }
  static int daysBetween({required DateTime to}) {
    return to.difference(DateTime.now()).inDays;
  }

  // static String getTimeAgo(DateTime? time, {bool short = false}) {
  //   if (time == null) return "";
  //   String currentLng = SharedPref.getCurrentLang() ?? "en";
  //   bool isAr = currentLng == "ar";
  //   timeago.setLocaleMessages(
  //     "$currentLng${short ? "_short" : ""}",
  //     (short && isAr)? timeago.ArShortMessages():
  //     (short && !isAr)? timeago.EnShortMessages():
  //     (isAr)? timeago.ArMessages(): timeago.EnMessages(),
  //   );
  //   return timeago.format(time, locale: "$currentLng${short ? "_short" : ""}");
  // }

  static Future<bool?> _getImageSource(BuildContext context)async {
    bool? isGallery;
    await showCupertinoModalPopup(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true, builder: (context) {
      return CupertinoAlertDialog(
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text('choose_image_source'.tr,style: TextStyle(color: ColorConfig().blackColor(1),fontSize: 20)),
        ),
        actions: [
          Material(
              color: ColorConfig().greyColor(0.1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = true;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Text('from_gallery'.tr,style: TextStyle(color: ColorConfig().blackColor(1),fontSize: 20),)),
              )
          ),
          Material(
              color: ColorConfig().greyColor(.1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = false;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Text('from_camera'.tr,style: TextStyle(color: ColorConfig().blackColor(1),fontSize: 20),)),
              )
          ),
        ],
      );
    }
    );
    return isGallery;
  }

  // static Future<List<File>> pickImages({required BuildContext context})async {
  //   final List<XFile> files = await ImagePicker().pickMultiImage(imageQuality: 25);
  //   return files.map((e) => File(e.path)).toList();
  // }

  static String getImageExtension(String imagePath) {
    // Get the last index of '.' in the image path
    int lastIndex = imagePath.lastIndexOf('.');

    // If '.' is found and it's not the last character
    if (lastIndex != -1 && lastIndex < imagePath.length - 1) {
      // Extract the extension by taking substring from the last '.' to the end
      return imagePath.substring(lastIndex + 1).toLowerCase();
    } else {
      // Return an empty string if no extension is found
      return '';
    }
  }
  static Future<File?> getFileFromUrl(String? url) async {
    if(url==null) return null;
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      return await file.writeAsBytes(bytes, flush: true);
    } catch (e) {
      return null;
    }
  }

  static showBottomSheetWithDynamicHeight({
    required BuildContext context,
    required Widget widget,
    Function? onDismiss,
    bool isDismissible=true,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      isDismissible:isDismissible ,
      builder: (BuildContext context)=> widget,).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }
  static showBottomSheet({
    required BuildContext context,
    required Widget widget,
    Function? onDismiss,
    double heightScreen = 0.6,
  }) {
    showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(.3),
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return DraggableScrollableSheet(
              initialChildSize: heightScreen,
              maxChildSize: heightScreen,
              minChildSize: heightScreen,
              expand: true,
              builder: (context, scrollController) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),

                    child: widget);
              });
        }).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }


  static showBottomSheetOld({required BuildContext context, required Widget widget, Function? onDismiss,}) async{
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(25))),
      backgroundColor: ColorConfig().whiteColor(1),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context)=> Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: widget,),).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }

  static String getFileSize(File? file){
    if(file == null) return "0";
    return (file.lengthSync()/1024).toStringAsFixed(2);
  }
  static String getFileName(File? file){
    if(file == null) return "0";
    return file.path.split("/").last ;
  }

  static Future getOnlineFileSize(String? url)async{
    if(url == null) return null;
    http.Response r = await http.head(Uri.parse(url));
    return r.headers["content-length"];
  }
  static Future animatedDialog({required BuildContext context, required Widget child})async{
    showGeneralDialog(
      barrierLabel: "label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return child;
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
  static Future<String> getChatFolderPath()async{
    String folderName = "chat";
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    final Directory newDirectory = Directory('$appDocumentsPath/$folderName/');
    return (await newDirectory.create(recursive: true)).path;
  }
  // static Future<File?> getAndDownloadEquitableFile({String? fileName,String? filePath,bool canDownload = true})async{
  //   if(fileName == null) return null;
  //   String folderPath = await getChatFolderPath();
  //   final allFiles = Directory(folderPath).listSync();
  //   for (FileSystemEntity file in allFiles) {
  //     if(file.path.contains(fileName)) return File(file.path);
  //   }
  //   if(!canDownload) return null;
  //
  //   Uint8List? downloadedData = await APIHelper.getDataFromUrl(url: filePath);
  //   if(downloadedData == null) return null;
  //   return File("$folderPath/$fileName.m4a")..writeAsBytesSync(downloadedData);
  // }
  // static handleError(var result){
  //   if(result.runtimeType != String){
  //     ToastHelper.showError(message: result.join('!@#').replaceAll('!@#', "'\n"));
  //   }else{
  //     ToastHelper.showError(message: result);
  //   }
  // }
  static Color getColorText({required String status}) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
      case 'approved':
      case 'approvedWithDeduction':
        return  Colors.green;
      case 'rejected':
        return  Colors.red;
      default:
        return Colors.lightBlue;
    }
  }
  static Widget imageErrorBuilder({double? width, double? height,bool isCircle = false}) {
    double? iconSize = ((width??0)+ (height??0))/2.5;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: isCircle?BoxShape.circle:BoxShape.rectangle,
        color: Colors.grey,
      ),
      alignment: Alignment.center,
      child: Icon(Icons.broken_image_outlined,color: Colors.white,size: iconSize,),
    );
  }

}
