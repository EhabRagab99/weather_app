import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_home/controller/api/api_get_weather.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/connection_error_widget.dart';
import 'package:iem_app/widgets/default_text_widget.dart';
import 'package:iem_app/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/provider/state_on_display_day_details.dart';

class BarHomeScreen extends StatefulWidget{

  const BarHomeScreen({super.key});

  @override
  State<BarHomeScreen> createState() => _BarHomeScreenState();
}

class _BarHomeScreenState extends State<BarHomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  final DateTime
  today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextDefaultWidget(
          title:'3-Day Weather Forecast',
          fontSize: SizeConfig.height * 0.026,
          color: ColorConfig().whiteColor(1),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          return Builder(
              builder: (context) {
                if (ApiGetWeather().isWaiting) {
                  return Center(
                    child: LoadingAnimationWidget(
                      color: ColorConfig().whiteColor(1),
                    ),
                  );
                }
                if (ApiGetWeather().connectionError) {
                  return CustomErrorWidget(
                    isApiError: false,
                    isConnectionError: true,
                    tryAgainOnTap: () async {
                      await ApiGetWeather().apiGetWeather(context: context);
                    },
                  );
                }
                if (ApiGetWeather().hasData) {
                  if (homeProvider.weatherResponseModel?.list.isEmpty == true) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.2),
                      child: Center(
                        child: Text(
                          'no_available_assignments'.tr,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 3, // Showing current day + next 2 days
                      itemBuilder: (context, index) {
                        // final isToday = index == 0;
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.height * 0.012)),
                          margin: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.01),
                          color: index == 0 ? Colors.teal.shade100 : Colors.white, // Highlight current day
                          child: ListTile(
                            contentPadding: EdgeInsets.all(SizeConfig.height * 0.02),
                            leading: Icon(
                              Icons.calendar_today,
                              size: SizeConfig.height * 0.04,
                              color: index == 0 ? Colors.teal : Colors.grey.shade700,
                            ),
                            title: Text(
                              // "${date.day}-${date.month}-${date.year}${isToday ? " (Today)" : ""}",
                              // "${homeProvider.firstThreeDays[index].dtTxt.toString()}${isToday ? " (Today)" : ""}",
                              "${DateFormat('yyyy-MM-dd').format(homeProvider.firstThreeDays[index].dtTxt!)} ${index == 0 ? " (Today)" : ""}",
                              style: TextStyle(
                                fontSize: SizeConfig.height * 0.022,
                                fontWeight: FontWeight.w500,
                                color: index == 0 ? Colors.teal.shade900 : Colors.black,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                              color: index == 0 ? Colors.teal : Colors.grey,
                              size: SizeConfig.height * 0.03,
                            ),
                            onTap: () => StateOnDisplayDayDetails(context).onDisplayDayDetails(context: context, day: homeProvider.firstThreeDays[index]),
                          ),
                        );
                      },
                    );
                  }
                }
                return const SizedBox();
              }
          );
        }
      ),
    );
  }
}


