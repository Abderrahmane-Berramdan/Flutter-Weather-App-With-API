class WeatherModel {
  final String name;
  final Temperature temperature;
  final List<WeatherInfo> weatherInfo;
  final Wind wind;

  WeatherModel({
    required this.name,
    required this.temperature,
    required this.weatherInfo,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json["name"],
      temperature: Temperature.fromJson(json["main"]),
      weatherInfo: (json["weather"] as List<dynamic>)
          .map((weather) => WeatherInfo.fromJson(weather))
          .toList(),
      wind: Wind.fromJson(json["wind"]),
    );
  }
}

class Temperature {
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;

  Temperature({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.seaLevel,
    required this.pressure,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json["temp"] - 273.15, // Kelvin to Celsius
      tempMin: json["temp_min"] - 273.15, // Kelvin to Celsius
      tempMax: json["temp_max"] - 273.15, // Kelvin to Celsius
      humidity: json["humidity"],
      seaLevel: json["sea_level"],
      pressure: json["pressure"],
    );
  }
}

class WeatherInfo {
  final String main;

  WeatherInfo({required this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(main: json["main"]);
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json["speed"]);
  }
}