import 'dart:developer';

import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_home/model/weather_response_model.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ApiGetWeather extends GeneralApiState {
  static final ApiGetWeather _apiGetWeather = ApiGetWeather._internal();
  factory ApiGetWeather() {
    return _apiGetWeather;
  }
  ApiGetWeather._internal();
  HomeProvider homeProvider = HomeProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();

  Future apiGetWeather({required BuildContext context}) async {
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);

    setWaiting();
    homeProvider.listen();

    await ApiHelper.apiCalling(
      endPoint: "data/2.5/forecast?id=292223&appid=bd5e378503939ddaee76f12ad7a97608",
      requestType: RequestType.get,
      authorization: false,
    ).then((value) {
      hasData = true;
      setHasData();

        homeProvider.weatherResponseModel = WeatherResponseModel.fromJson(value);
        final Set<String> uniqueDates = {}; // To store unique dates
        homeProvider.firstThreeDays = []; // Initialize the list

      for (var item in homeProvider.weatherResponseModel?.list ?? []) {
        final date = DateFormat('yyyy-MM-dd').format(item.dtTxt!);
        if (!uniqueDates.contains(date)) {
          uniqueDates.add(date);
          homeProvider.firstThreeDays.add(item);
        }
        if (uniqueDates.length == 3) break; // Stop when we have 3 unique days
      }
      listen();
    }).catchError((error, stackTrace) {
      log("API Error: $error \nStackTrace: $stackTrace");

      if (error.toString() == "internet") {
        setConnectionError();
      } else {
        setHasError();
        setError(error);
      }
      homeProvider.listen();
    });

    homeProvider.listen();
  }

}
