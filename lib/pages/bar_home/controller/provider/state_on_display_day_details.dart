import 'package:iem_app/helpers/routes_handler/material_navigation.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:iem_app/pages/bar_home/model/weather_response_model.dart';
import 'package:iem_app/pages/bar_home/view/weather_details_screen.dart';
import 'package:provider/provider.dart';


class StateOnDisplayDayDetails{

  HomeProvider homeProvider = HomeProvider();

  StateOnDisplayDayDetails(BuildContext context){
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

   onDisplayDayDetails ({required BuildContext context, required ListElement day}) async {
     homeProvider.setSelectDay(day);
     customPushNavigator(
       context, WeatherDetailsScreen(
       day: day,
     ),
    );
  }
}