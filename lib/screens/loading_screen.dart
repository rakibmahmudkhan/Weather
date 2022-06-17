import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_by_me/controller/weather_controller.dart';
import 'package:weather_by_me/models/my_location.dart';
import 'package:weather_by_me/models/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

MyWeather? weather;
bool? isLoading;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getWeather();
    isLoading = true;
  }

  void getWeather() async {
    MyWeather mWeather = await WeatherController().getWeather();

    setState(() {
      weather = mWeather;
      isLoading = false;
    });
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getLocation();
    print(myLocation.lat);
    print(myLocation.lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: isLoading == false
          ? Container(
              child: Text(weather!.name!),
            )
          : CircularProgressIndicator(),
    ));
  }
}
