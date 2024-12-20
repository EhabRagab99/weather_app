import 'package:flutter/material.dart';
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_home/model/weather_response_model.dart';
import 'package:provider/provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final ListElement day;
  const WeatherDetailsScreen({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final weatherDetails = _getWeatherDetails(day);
    return Scaffold(
      backgroundColor: weatherDetails['backgroundColor'] as Color,
      body: SafeArea(
        child: Consumer<HomeProvider>(
            builder: (context, homeProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.height * 0.2,),
                Text(
                  weatherDetails['statusText'] as String,
                  style: TextStyle(
                    fontSize: SizeConfig.height * 0.032,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                 SizedBox(height: SizeConfig.height * 0.02),
                Icon(
                  weatherDetails['icon'] as IconData,
                  size: SizeConfig.height * 0.2,
                  color: weatherDetails['iconColor'] as Color,
                ),

                const Spacer(),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: SizeConfig.height * 0.009,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,                          children: [
                          Text(
                            homeProvider.weatherResponseModel?.city?.name ?? "unknown",
                            style: TextStyle(
                              fontSize: SizeConfig.height * 0.032,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${homeProvider.selectedDay?.main?.temp ?? "0.0"} °",
                            style: TextStyle(
                              fontSize: SizeConfig.height * 0.03,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),

                    WeatherStatBox(
                      label: "Wind",
                      value: "${homeProvider.selectedDay?.wind?.speed ?? "0.0"} km/h",
                    ),
                    const SizedBox(width: 8,),
                    WeatherStatBox(
                      label: "Humidity",
                      value: "${homeProvider.selectedDay?.main?.humidity ?? "0.0"} %",
                    ),

                  ],
                ),
                SizedBox(height: SizeConfig.height * 0.04,),
              ],
            );
          }
        ),
      ),
    );
  }

  Map<String, dynamic> _getWeatherDetails(ListElement day) {
    // String condition = day.weather.first.main ?? "";
    String condition = "snow";
    switch (condition.toLowerCase()) {
      case 'clear':
        return {
          'backgroundColor': Colors.orange.shade100,
          'icon': Icons.wb_sunny,
          'iconColor': Colors.amber,
          'statusText': "Sunny Day Walk",
        };
      case 'rain':
        return {
          'backgroundColor': Colors.blue.shade100,
          'icon': Icons.beach_access,
          'iconColor': Colors.blue,
          'statusText': "It's Raining Now",
        };
      case 'clouds':
        return {
          'backgroundColor': Colors.teal.shade100,
          'icon': Icons.cloud,
          'iconColor': Colors.grey,
          'statusText': "Cloudy Skies",
        };
      case 'snow':
        return {
          'backgroundColor': Colors.teal.shade100,
          'icon': Icons.cloudy_snowing,
          'iconColor': Colors.grey,
          'statusText': "Cloudy Skies",
        };
      default:
        return {
          'backgroundColor': Colors.grey.shade200,
          'icon': Icons.error,
          'iconColor': Colors.red,
          'statusText': "Unknown Weather",
        };
    }
  }
}

class WeatherStatBox extends StatelessWidget {
  final String label;
  final String value;

  const WeatherStatBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.height * 0.12,
      height: SizeConfig.height * 0.082,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: SizeConfig.height * 0.02,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: SizeConfig.height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
