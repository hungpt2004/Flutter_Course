class WeatherInfo {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String date;
  final String time;
  final double windSpeed;
  final double maxTemperature;
  final double minTemperature;
  final int humidity;
  final int pressure;
  final int seaLevel;

  WeatherInfo({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.date,
    required this.time,
    required this.windSpeed,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.pressure,
    required this.seaLevel,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      cityName: json['cityName'],
      temperature: json['temperature'],
      weatherDescription: json['weatherDescription'],
      date: json['date'],
      time: json['time'],
      windSpeed: json['windSpeed'],
      maxTemperature: json['maxTemperature'],
      minTemperature: json['minTemperature'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      seaLevel: json['seaLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temperature': temperature,
      'weatherDescription': weatherDescription,
      'date': date,
      'time': time,
      'windSpeed': windSpeed,
      'maxTemperature': maxTemperature,
      'minTemperature': minTemperature,
      'humidity': humidity,
      'pressure': pressure,
      'seaLevel': seaLevel,
    };
  }
}
