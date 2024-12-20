import 'dart:async';

import 'package:iem_app/helpers/connectivity_helpers/connectivity_update_helper.dart';
import 'package:iem_app/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ConnectivityInitProvider extends ChangeNotifier {
  bool hasConnection = true;
  String connectionName = "offline";
  // ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity({required BuildContext context}) async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.checkConnectivity();
      // connectionStatus = result;
      // ignore: use_build_context_synchronously
      setConnectionStatus(result: result,context: context);
      setConnectionName(result);
      // if (kDebugMode) {
      //   print("initConnectivity connection Status name = ${connectionStatus.name}");
      //   print("initConnectivity connection Status index = ${connectionStatus.index}");
      // }
      connectivity.onConnectivityChanged.listen(updateConnectionStatus);
      if (kDebugMode) {
        print(connectivity.hashCode);
      }
    } on PlatformException catch (e){
      if (kDebugMode) {
        print("check connectivity status = $e");
      }
      return;
    }
  }

  Future<void> updateConnectionStatus(ConnectivityResult result,) async {
    // connectionStatus = result;
    setConnectionStatus(result: result,context: AlphaWeatherAPP.navigatorKey.currentState!.context);
    setConnectionName(result);
    // if (kDebugMode) {
    //   print("updated connection Status name = ${connectionStatus.name}");
    //   print("updated connection Status index= ${connectionStatus.index}");
    // }
  }


  setConnectionStatus({required BuildContext context,required ConnectivityResult result}){

    // no internet
    if(hasConnection==false){
      if(result.index==1||result.index==3){
        hasConnection=true;
        ConnectionChangesProvider.connectionUpdatedListener(context: context);
        if (kDebugMode) {
          print("Connection = $hasConnection");
        }
      }
    }

    // with internet
    else {
      if(result.index!=1&&result.index!=3){
        hasConnection=false;
        ConnectionChangesProvider.connectionUpdatedListener(context: context);
        if (kDebugMode) {
          print("Connection = $hasConnection");
        }
      }
    }
  }

  setConnectionName(ConnectivityResult result) {
    switch (result.index) {
      case 1:
        connectionName = "wifi";
        break;
      case 3:
        connectionName = "cellular";
        break;
      case 4:
        connectionName = "offline";
        break;
    }
  }

}