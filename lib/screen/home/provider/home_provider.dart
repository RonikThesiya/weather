import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/screen/home/modal/WeatherClass.dart';

class HomeProvider extends ChangeNotifier {



  Future<WeatherClass> apicall ()async
  {
    String? apilink =
        "https://api.openweathermap.org/data/2.5/weather?lat=22.3072&lon=73.1812&appid=9628b95a2235abb2f18055013ade5de8";

    var weatherString = await http.get(Uri.parse(apilink));
    var weather = jsonDecode(weatherString.body);

    return WeatherClass.fromJson(weather);
  }
}
