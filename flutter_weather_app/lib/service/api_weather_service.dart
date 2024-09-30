import 'dart:convert';
import '../model/weather.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey =
      "83fdae2c3732d325ff317c91cffb9881&fbclid=IwY2xjawFnPWFleHRuA2FlbQIxMAABHX2QokcyE15U2-X7eu70-n8976C_RTSU5YWiiMcJESzgjXA6sWHoStrUNg_aem_kE5fpTXxoOQQL987HlNVUA";
  final String baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<WeatherInfo> fetchWeatherCity(String cityName) async {
    // URL để lấy thông tin thời tiết theo thành phố
    String url = '$baseUrl/weather?q=$cityName&appid=$apiKey';

    try {
      // Gọi API với phương thức GET
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse dữ liệu JSON từ response
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Chuyển đổi JSON thành đối tượng WeatherInfo
        return WeatherInfo(
          cityName: jsonData['name'],
          temperature: jsonData['main']['temp'],
          weatherDescription: jsonData['weather'][0]['description'],
          date: DateTime.now().toString().split(' ')[0], // Ngày hiện tại
          time: DateTime.now().toString().split(' ')[1], // Thời gian hiện tại
          windSpeed: jsonData['wind']['speed'],
          maxTemperature: jsonData['main']['temp_max'],
          minTemperature: jsonData['main']['temp_min'],
          humidity: jsonData['main']['humidity'],
          pressure: jsonData['main']['pressure'],
          seaLevel: jsonData['main']['sea_level'] ??
              0, // Mực nước biển, nếu không có thì mặc định 0
        );
      } else {
        // Nếu không thành công, ném ngoại lệ với thông báo lỗi
        throw Exception("Failed to load weather for $cityName");
      }
    } catch (e) {
      // Bắt lỗi và ném ngoại lệ
      throw Exception(e.toString());
    }
  }
}
