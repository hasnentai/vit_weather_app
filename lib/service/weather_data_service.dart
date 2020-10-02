

import 'package:flutter/material.dart';
import 'package:vit_weatherapp/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService{



  static const Base_URL ="https://raw.githubusercontent.com/hasnentai/openweather/main/weatherdata.json";

  Future<WeatherData> getWeather() async{
    var response = await http.get(Base_URL);
    var jsonResponse = json.decode(response.body.toString());
    debugPrint(jsonResponse['weather'].toString());
    return WeatherData.fromJson(jsonResponse['weather']);
   
  }
 
}