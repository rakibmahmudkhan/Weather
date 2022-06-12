import 'package:dio/dio.dart';
import 'package:weather_by_me/repository/weather_repository.dart';

class WeatherController {
  Future<String> getWeather() async {
    try {
      Response response = await WeatherRepository().getWeather();
      print(response);
      if (response.statusCode == 200) {
        return response.data["name"];
      } else {
        return "Null";
      }
    } catch (error) {
      print(error);
      return "No name";
    }
  }
}
