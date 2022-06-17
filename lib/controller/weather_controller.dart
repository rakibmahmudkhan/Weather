import 'package:dio/dio.dart';
import 'package:weather_by_me/models/weather.dart';
import 'package:weather_by_me/repository/weather_repository.dart';

class WeatherController {
  Future<MyWeather> getWeather() async {
    try {
      Response response = await WeatherRepository().getWeather();
      print(response);
      if (response.statusCode == 200) {
        return MyWeather.fromJson(response.data);
      } else {
        return MyWeather();
      }
    } catch (error) {
      print(error);
      return MyWeather();
    }
  }
}
