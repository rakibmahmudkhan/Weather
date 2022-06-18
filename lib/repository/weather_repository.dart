import 'package:dio/dio.dart';
import 'package:weather_by_me/utilities/api_constant.dart';

Duration duration = Duration(seconds: 60);

class WeatherRepository {
  Future<Response> loadWeather({double? latitude, double? longitude}) async {
    String api =
        "${ApiConstant.BASE_URL}?APPID=${ApiConstant.APP_ID}&lat=$latitude&lon=$longitude";
    Response response = await Dio().get(api).timeout(duration);
    return response;
  }
}
//"http://api.openweathermap.org/data/2"
//             ".5/weather?q=Dhaka&APPID=705a38d095c9e617bbe3fa0352b79af6"
