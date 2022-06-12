import 'package:dio/dio.dart';

Duration duration = Duration(seconds: 60);

class WeatherRepository {
  Future<Response> getWeather() async {
    Response response = await Dio()
        .get("http://api.openweathermap.org/data/2"
            ".5/weather?q=Dhaka&APPID=705a38d095c9e617bbe3fa0352b79af6")
        .timeout(duration);
    return response;
  }
}
