import 'package:flutter/material.dart';

import 'package:weather_by_me/controller/weather_controller.dart';
import 'package:weather_by_me/models/my_location.dart';
import 'package:weather_by_me/models/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

MyWeather? weather;
bool? isLoading;
double? lat;
double? lon;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();

    isLoading = true;
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getLocation();
    lat = myLocation.latitude;
    lon = myLocation.longitude;
    loadWeather();
  }

  void loadWeather() async {
    MyWeather mWeather =
        await WeatherController().loadWeather(lat: lat!, lon: lon!);

    setState(() {
      weather = mWeather;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: isLoading == false
          ? Container(
              child: Text(weather!.wind!.speed!.toString()),
            )
          : CircularProgressIndicator(),
    ));
  }
}
