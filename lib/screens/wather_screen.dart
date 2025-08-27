import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/wather_model.dart';
import 'package:weather_app/service/wather_service.dart';

import 'package:weather_app/widgets/detaile_collumn.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModel weather;
  bool isLoading = false;
  String formattedDate = DateFormat("EEEE d, MMMM yyyy").format(DateTime.now());
  String formattedTime = DateFormat("hh:mm a").format(DateTime.now());

  @override
  void initState() {
    weather = WeatherModel(
      name: "",
      temperature: Temperature(
        temp: 0.0,
        tempMin: 0.0,
        tempMax: 0.0,
        humidity: 0,
        seaLevel: 0,
        pressure: 0,
      ),
      weatherInfo: [],
      wind: Wind(speed: 0.0),
    );
    super.initState();
    fetchWeather();
  }

  fetchWeather() {
    setState(() {
      isLoading = true;
    });
    WeatherService.fetchWeather().then((value) {
      setState(() {
        weather = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF676BD0),
      body: SafeArea(
        child: Visibility(
          visible: isLoading,
          replacement: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    weather.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${weather.temperature.temp.toStringAsFixed(2)} °C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (weather.weatherInfo.isNotEmpty)
                    Text(
                      weather.weatherInfo[0].main,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/photo.png"),
                  ),

                  Container(
                    height: 250,
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 78, 82, 188),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetaileCollumn(
                              icon: Icons.wind_power,
                              value: weather.wind.speed,
                              unity: "km/h",
                              name: "Wind",
                              color: Colors.white,
                            ),
                            DetaileCollumn(
                              icon: Icons.sunny,
                              value: weather.temperature.tempMax,
                              unity: "°C",
                              name: "Max",
                              color: Colors.white,
                            ),
                            DetaileCollumn(
                              icon: Icons.wind_power,
                              value: weather.temperature.tempMin,
                              unity: "°C",
                              name: "Min",
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetaileCollumn(
                              icon: Icons.water_drop_rounded,
                              value: weather.temperature.humidity.toDouble(),
                              unity: "%",
                              name: "Humidity",
                              color: Colors.orange,
                            ),
                            DetaileCollumn(
                              icon: Icons.wind_power,
                              value: weather.temperature.pressure.toDouble(),
                              unity: "hPa",
                              name: "Pressure",
                              color: Colors.orange,
                            ),
                            DetaileCollumn(
                              icon: Icons.bar_chart,
                              value: weather.temperature.seaLevel.toDouble(),
                              unity: "m",
                              name: "Sea-Level",
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          child: Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
      ),
    );
  }
}
