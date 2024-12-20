// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/main.dart';
// import 'package:iem_app/main.dart';
//
// class PreviewFileHelper{
//
//
//  static previewCVFileSheet({
//     required BuildContext context,
//     required String extension,
//     required bool isFromLocal,
//     required String imageUrl,
//     required bool withDownload,
//     required String fileNameToSave,
//   }) async {
//     showMaterialModalBottomSheet(
//       expand: false,
//       isDismissible: true,
//       context: TaskApp.navigatorKey.currentState!.context,
//       backgroundColor:ColorConfig().scaffoldBackgroundColor(0.0),
//       barrierColor: ColorConfig().cardGrey3Color(0.7),
//       enableDrag: false,
//       builder: (context) =>ClipRRect(
//         borderRadius: BorderRadius.only(topRight: Radius.circular(SizeConfig.height*.030),topLeft: Radius.circular(SizeConfig.height*.030)),
//         child: SizedBox(
//           height: SizeConfig.height*.9,
//           child:PreviewFileSheetWidget(
//             imageUrl:imageUrl ,
//             extension:extension ,
//             fileNameToSave: fileNameToSave,
//             withDownload: withDownload,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//  static Future previewFileLauncher({required String url,required BuildContext context,required String fileNameToSave,required String extension,}) async{
//    DownloadFileHelper downloadFileHelper =DownloadFileHelper(context);
//    downloadFileHelper.downloadFile(fileNameToSave: fileNameToSave, extension: extension, url: url,isFromLocal: true);
//
//
//
//  }
//
// }
//
//
