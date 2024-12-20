import 'package:iem_app/pages/bar_home/model/weather_response_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  factory HomeProvider() {
    _this ??= HomeProvider._();
    return _this!;
  }
  static HomeProvider? _this;
  HomeProvider._();

  WeatherResponseModel? weatherResponseModel;
  List<ListElement> firstThreeDays = []; // To store the first 3 days
  ListElement? selectedDay; // To store the selected day's details
  void setSelectDay(ListElement listElement) {
    selectedDay = listElement;
    notifyListeners();
  }



  listen() {
    notifyListeners();
  }

}
