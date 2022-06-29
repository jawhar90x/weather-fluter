import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'e176b99dcf517396be9a6f110dd11195',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openwethermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
