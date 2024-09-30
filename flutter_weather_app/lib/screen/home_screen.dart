import 'package:flutter/material.dart';
import '../model/weather.dart';
import '../service/api_weather_service.dart';
import 'package:intl/intl.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final ApiService _apiService = ApiService();
  WeatherInfo? _weatherInfo;
  String _errorMessage = '';

  final List<String> _cities = ['Hanoi', 'Ho Chi Minh', 'Da Nang', 'Nha Trang', 'London', 'France', 'Russia'];
  String? _selectedCity = "Hanoi";

  @override
  void initState() {
    super.initState();
    _fetchWeather(_selectedCity!);
  }

  Future<void> _fetchWeather(String cityName) async {
    if (cityName.isEmpty) {
      setState(() {
        _errorMessage = 'Please select a city';
      });
      return;
    }

    WeatherInfo? weatherInfo = await _apiService.fetchWeatherCity(cityName);

    setState(() {
      if (weatherInfo != null) {
        _weatherInfo = weatherInfo;
        _errorMessage = '';
      } else {
        _errorMessage = 'Failed to fetch weather data';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 120, vertical: 5),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              dropdownColor: Colors.deepPurple,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCity = newValue;
                  _errorMessage = '';
                });
                if (newValue != null) {
                  _fetchWeather(newValue);
                }
              },
              items: _cities.map<DropdownMenuItem<String>>((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            const SizedBox(height: 10,),
            if (_weatherInfo != null) ...[
              Text(
                '${(_weatherInfo!.temperature / 10).toStringAsFixed(2)}°C', // Divide by 10 for conversion and format
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Text(
                // _weatherInfo!.weatherDescription,
                'Clouds',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                _formatDate(_weatherInfo!.date),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                _formatTime(_weatherInfo!.date, _weatherInfo!.time),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(Icons.cloud, size: 200, color: Colors.blue[100]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeatherDetail(
                            iconColor: Colors.white,
                            icon: Icons.air,
                            label: 'Wind',
                            value: '${_weatherInfo!.windSpeed} km/h'),
                        _WeatherDetail(
                            iconColor: Colors.white,
                            icon: Icons.arrow_upward,
                            label: 'Max',
                            value: '${(_weatherInfo!.maxTemperature/10).toStringAsFixed(2)}°C'),
                        _WeatherDetail(
                            iconColor: Colors.white,
                            icon: Icons.arrow_downward,
                            label: 'Min',
                            value: '${(_weatherInfo!.minTemperature/10).toStringAsFixed(2)}°C'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeatherDetail(
                            iconColor: Colors.yellow,
                            icon: Icons.water,
                            label: 'Humidity',
                            value: '${_weatherInfo!.humidity}%'),
                        _WeatherDetail(
                            iconColor: Colors.yellow,
                            icon: Icons.speed,
                            label: 'Pressure',
                            value: '${_weatherInfo!.pressure} hPa'),
                        _WeatherDetail(
                            iconColor: Colors.yellow,
                            icon: Icons.cloud,
                            label: 'Sea-Level',
                            value: '${_weatherInfo!.seaLevel} m'),
                      ],
                    ),
                  ],
                ),
              )
            ] else if (_errorMessage.isNotEmpty) ...[
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('EEEE, dd MMMM yyyy').format(parsedDate);
  }

  String _formatTime(String date, String time) {
    DateTime parsedTime = DateTime.parse('$date $time');
    return DateFormat('hh:mm a').format(parsedTime);
  }
}

class _WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const _WeatherDetail({required this.icon, required this.label, required this.value, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
