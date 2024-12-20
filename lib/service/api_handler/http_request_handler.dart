import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/http_request_exception.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';

enum RequestType { get, post, put, delete }

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
      super.method,
      super.url, {
        required this.onProgress,
      });
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}

class ApiHelper {

  //singleton
  static final ApiHelper _apiInstance = ApiHelper._internal();
  ApiHelper._internal();
  static ApiHelper get instance => _apiInstance;

  static Future<dynamic> apiCalling({
    required String endPoint,
    required RequestType requestType,
    bool authorization = true,
    var body,
    Map<String, String>? customHeaders,
    bool isMultiPartFile = false,
    bool customResponse = false,
    List<http.MultipartFile> files = const [],
    bool hasTempUrl = false,
  }) async {
    String? fullUrl;
    if (!endPoint.isNullOrEmpty) {
      if(hasTempUrl == true){

        log("Temp URL: https://api.openweathermap.org/$endPoint" );
        fullUrl = "api.openweathermap.org/$endPoint" ;
      }else{
        fullUrl = AmncoBaseServerUrl.singletonUrl.value + endPoint;
      }
    }
    http.Response? response;
    final Map<String, String> headers = customHeaders ??
        {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Accept-Language': SharedPref.getCurrentLang() ?? "ar",
          // 'Authorization': authorization? 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}':''
        };



    if(!fullUrl.isNullOrEmpty) {
      Uri finalFullUri = Uri.parse(fullUrl!);
      try {
        if (!isMultiPartFile) {
          if (kDebugMode) {
            if(hasTempUrl == false){
              log("FULL URL IS: ${AmncoBaseServerUrl.singletonUrl.value}$endPoint");
              log("API HEADERS ARE: ${headers.toString()}");
              log("Lang is: ${SharedPref.getCurrentLang().toString()}");
              if(body != null) {
                log("API BODY IS: ${body.toString()}");
              }
              if(customHeaders != null) {
                log("API CUSTOM HEADER ARE: ${customHeaders.toString()}");
              }
            }else{
              log("Temp URL: api.openweathermap.org/$endPoint" );
            }

          }
          switch (requestType) {
            case RequestType.get:
              {
                if (body != null) {

                  final newURI = finalFullUri.replace(queryParameters: body);
                  response = await http.get(newURI, headers: headers).timeout(const Duration(minutes: 1));
                  if(kDebugMode){
                    log("API STATUS CODE IS: ${response.statusCode}");
                    log("API RESPONSE IS: ${response.body}");
                    log("API BODY IS: ${body.toString()}");
                  }
                } else {
                  response = await http.get(finalFullUri, headers: headers);
                  if(kDebugMode){
                    log("API STATUS CODE IS: ${response.statusCode}");
                    log("API RESPONSE yap IS: ${response.body}");
                    log("API BODY IS: ${body.toString()}");
                  }
                }
              }
              break;
            case RequestType.post:
              {
                response = await http.post(finalFullUri, headers: headers, body: jsonEncode(body));
                if(kDebugMode){
                  log("API STATUS CODE IS: ${response.statusCode}");
                  log("API RESPONSE IS: ${response.body}");
                  log("API BODY IS: ${body.toString()}");
                }
              }
              break;
            case RequestType.put:
              {
                response = await http.put(finalFullUri, headers: headers, body: jsonEncode(body));
                if(kDebugMode){
                  log("API STATUS CODE IS: ${response.statusCode}");
                  log("API RESPONSE IS: ${response.body}");
                  log("API BODY IS: ${body.toString()}");
                }
              }
              break;
            case RequestType.delete:
              {
                response = await http.delete(finalFullUri, headers: headers);
                if(kDebugMode){
                  log("API STATUS CODE IS: ${response.statusCode}");
                  log("API RESPONSE IS: ${response.body}");
                  log("API BODY IS: ${body.toString()}");
                }
              }
              break;
            default:
              break;
          }
          if(response != null) {
            return _responseExceptionHandler(response);
          }

          // // check user if unauthorized
          // if (apiResponse?.code == 401 && !(fullUrl.contains('/login'))) {
          //   UiMessages.errorMessage(content: '${apiResponse.error?.message}');
          //   locator<UserProvider>().logout();
          // }
        }
        else {
          var request = MultipartRequest(
            requestType.name,
            finalFullUri,
            onProgress: (int bytes, int total) async {
              final progress = bytes / total;
              log(">>>>>>>>> progress: $progress");
            },
          );
          request.fields.addAll(body);
          for (int i = 0; i < files.length; i++) {
            request.files.add(files[i]);
          }
          request.headers.addAll({
            "Content-Type": "multipart/form-data",
            'Accept': 'multipart/form-data',
            'Accept-Language': SharedPref.getCurrentLang() ?? "ar",
            // 'Authorization': authorization? 'Bearer ${SharedPref.getUserObg()?.userData?.accessToken??''}':''
          });

          if (kDebugMode) {
            log("FULL URL IS: ${AmncoBaseServerUrl.singletonUrl.value}$endPoint");
            log("API HEADERS ARE: ${request.headers.toString()}");
            if(body != null) {
              log("API BODY IS: ${body.toString()}");
            }
            if(customHeaders != null) {
              log("API CUSTOM HEADER ARE: ${customHeaders.toString()}");
            }
          }
          http.StreamedResponse response = await request.send().timeout(const Duration(minutes: 1),
              onTimeout: () async => await ShowToastFunctions.showToast(
                  context: AlphaWeatherAPP.navigatorKey.currentState!.context,
                  msg: "timeOutErrorMessage".tr,
                  toastType: ToastType.error
                // isTranslate: true
              ));
          String result = await response.stream.bytesToString();
          log(response.statusCode.toString());
          log("ya pop:lll ${jsonEncode(result)}");

          // if (response.statusCode == 401) {
          //   customPushReplacement(AlphaWeatherAPP.navigatorKey.currentState!.context, const LoginScreen());
          //   return;
          // } else
          if (response.statusCode == 500 || response.statusCode == 503) {
            ShowToastFunctions.showToast(
                context: AlphaWeatherAPP.navigatorKey.currentState!.context,
                msg: "apiErrorBody".tr,
                toastType: ToastType.error
              // isTranslate: true
            );
            return;
          }
          log(result.toString());
          if (kDebugMode) {
            log("ya pop:lll ${json.decode(result)}");
          }
         return json.decode(result);
          return response;
        }
      }on SocketException {
        ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          msg: "offlineConnect".tr,
          toastType: ToastType.error,
        );
        throw InternetException('internet');

      }on HttpException catch(httpException) {
        throw const HttpException("httpException");
      }on FormatException catch(formException) {
        throw const FormatException('formException');
      }on TimeoutException catch(timeOutException) {
        throw TimeoutException("timeOutErrorMessage".tr);
      }on HandshakeException catch(handShakeException) {
      }
      catch (error) {
        return _responseExceptionHandler(response!);
      }
      return _responseExceptionHandler(response!);

    }
  }

}

Future<http.Response> convertStreamedResponseToResponse(http.StreamedResponse streamedResponse) async {
  // Convert the StreamedResponse to a Response
  return http.Response.fromStream(streamedResponse);
}
http.Response convertFromUint8ListToHttpResponse(Uint8List responseData) {
  // Decode the Uint8List into a string
  String responseBody = utf8.decode(responseData);

  // Create an http.Response object with a status code of 200
  return http.Response(responseBody, 200);
}

http.StreamedResponse convertToStreamedResponse(Uint8List responseData) {
  // Create a stream from the Uint8List data
  Stream<List<int>> responseStream = Stream.fromIterable([responseData]);

  // Create an http.StreamedResponse object with a status code of 200
  return http.StreamedResponse(responseStream, 200);
}

Future<http.Response> convertFromStreamedResponseToHttpResponse(http.StreamedResponse streamedResponse) async {
  // Read the streamed response body and combine the lists of bytes
  List<int> bodyBytes = await streamedResponse.stream.expand((bytes) => bytes).toList();

  // Create an http.Response object with the body bytes and other properties
  return http.Response.bytes(
    bodyBytes,
    streamedResponse.statusCode,
    headers: streamedResponse.headers,
    persistentConnection: streamedResponse.persistentConnection,
    reasonPhrase: streamedResponse.reasonPhrase,
    isRedirect: streamedResponse.isRedirect,
    // contentLength: streamedResponse.contentLength,
    request: streamedResponse.request,
    // context: streamedResponse.context,
    // encoding: streamedResponse.encoding,
  );
}

///Exception STATUE
dynamic _responseExceptionHandler(http.Response response) async {
  var responseBody = json.decode(response.body);
  log("API RESPONSE dfdffd IS: ${response.body}");
  log("API RESPONSE yrerer ap IS: ${responseBody}");
  log("API RESPONSE yrerer ap IS: ${response.statusCode}");
  String errorMessage = "Unknown error";
  // if(response.statusCode != 200 || response.statusCode != 201) {
  //   if (kDebugMode) {
  //     log('errrrorrrrs ${responseBody['errors']}');
  //   }
  //   if (kDebugMode) {
  //     log('erroreeeerrrrr ${responseBody['error']}');
  //   }
  //   if (kDebugMode) {
  //     log('messagesaessses ${responseBody['messages']}');
  //     log('messageeeeeeee ${responseBody['message']}');
  //   }
  //
  //   if (responseBody['errors'] != null && responseBody['errors'].isNotEmpty) {
  //     // 'error' is null, but 'errors' is present and not empty, use the first error message
  //     errorMessage = responseBody['errors'].first;
  //   } else if (responseBody['messages'] != null &&
  //       responseBody['messages'].isNotEmpty) {
  //     // Both 'error' and 'errors' are null, but 'messages' is present and not empty, use the first message
  //     errorMessage = responseBody['messages'].first;
  //   } else if (responseBody['message'] != null) {
  //     errorMessage = responseBody['message'];
  //   }else{
  //     errorMessage = responseBody.toString();
  //
  //     log('Error in handler ya pop: $errorMessage');
  //     log('status code in handler ya pop: ${response.statusCode}');
  //
  //   }
  //   // else if (responseBody['error'] != null) {
  //   //   // 'error' is not null, use it
  //   //   errorMessage = responseBody['error'];
  //   // }
  //
  // }
  switch (response.statusCode) {
  // success response
    case 200:
    case 201:
    case 202:
      return json.decode(response.body);

  case 204:
      log('no content');
      return {
        "statusCode": 204,
        "message":null,
        "data":  null
      };

    case 500:
    case 503:
      debugPrint('server error ya pop: =${response.body}');
      ShowToastFunctions.showToast(
        context: AlphaWeatherAPP.navigatorKey.currentState!.context,
        msg: "apiErrorBody".tr,
        toastType: ToastType.error,
        // isTranslate: true
      );
      return json.decode(response.body);

    case 400:
    // bad request Exception
      debugPrint('bad request or otp wrong ya pop === ${response.body}');
        ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          msg: errorMessage,
          toastType: ToastType.error,
        );

      return json.decode(response.body);

    case 401:
      ShowToastFunctions.showToast(
        context: AlphaWeatherAPP.navigatorKey.currentState!.context,
        msg: errorMessage,
        toastType: ToastType.error,
        // isTranslate: true
      );

      ShowToastFunctions.showToast(context: AlphaWeatherAPP.navigatorKey.currentState!.context, msg: "unAuthErrorMessage".tr,);
      SharedPref.logOut();
      // customPushReplacement(AlphaWeatherAPP.navigatorKey.currentState!.overlay!.context, const LoginScreen());
      return json.decode(response.body);
    case 422:
    case 405:
        ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          msg: errorMessage,
          toastType: ToastType.error,
        );

        debugPrint('bad request or otp wrong ya pop === ${response.body}');
        return json.decode(response.body);
      case 409:
        ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          msg: errorMessage,
          toastType: ToastType.error,
        );
      return json.decode(response.body);

    case 404:
      log('Not Found 404 ya pop');
      ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          // msg: "not_found_status_code".tr,
          msg: errorMessage,
          toastType: ToastType.error
        // isTranslate: true
      );
      return json.decode(response.body);

    case 410:
      return json.decode(response.body);

    case 408:
      ShowToastFunctions.showToast(
          context: AlphaWeatherAPP.navigatorKey.currentState!.context,
          msg: "timeOutErrorMessage".tr,
          toastType: ToastType.error
        // isTranslate: true
      );
      // Time Out Exception
      if (kDebugMode) {
        log('Time Out Exception 408 ya pop');
      }
      return json.decode(response.body);

    default:
      ShowToastFunctions.showToast(
        context: AlphaWeatherAPP.navigatorKey.currentState!.context,
        msg: response.body,
        toastType: ToastType.error,
        // isTranslate: true
      );
      if (kDebugMode) {
        log('exception error url: ${response.request!.url} status code: ${response.statusCode}');
      }
      return json.decode(response.body);
  }
}



