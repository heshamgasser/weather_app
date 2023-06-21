import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/component/constant.dart';
import 'package:weather_app/models/ForecastWeather.dart';
import 'package:weather_app/models/WeatherData.dart';


class ApiManager {

 static Future<WeatherData> getCityWeather (String location) async {

    Uri url = Uri.https(BASEURL, CURRENT_ENDPOINT, {
      'key' : APIKEY,
      'q' : location
    },);

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    WeatherData weatherData = WeatherData.fromJson(json);
    return weatherData;
  }


 // static Future<ForecastWeather> getForecastWeather (String location) async {
 //
 //   Uri url = Uri.https(BASEURL, FORECAST_ENDPOINT, {
 //     'key' : APIKEY,
 //     'q' : location
 //   },);
 //
 //   http.Response response = await http.get(url);
 //   var json = jsonDecode(response.body);
 //   ForecastWeather forecastWeather = ForecastWeather.fromJson(json);
 //   return forecastWeather;
 // }

}