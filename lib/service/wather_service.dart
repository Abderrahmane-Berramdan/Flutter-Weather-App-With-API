import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/wather_model.dart';

class WeatherService {
  static fetchWeather() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=36.4651&lon=7.4306&appid=c184514b1722a6dcb469a5826f694011";

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
