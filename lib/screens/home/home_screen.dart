import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // api key
  final _weatherService = WeatherService('c90631139580f2d0092474eb2d225c35');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();
    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // any errors
    catch (e) {
      print('Weather API Error: ' + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // fetch the weather at the start up
    _fetchWeather();
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'sources/sun.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'sources/cloud.json';
      case 'shower rain':
        return 'sources/rain.json';
      case 'thunderstorm':
        return 'sources/thunder.json';
      case 'clear':
        return 'sources/sun.json';
      default:
        return 'sources/sun.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // User icon
                Image(
                  image: AssetImage('sources/user.png'), // 替换为你的图标路径
                  width: 32, // 设置图标宽度
                  height: 32, // 设置图标高度
                ),
                SizedBox(width: 16), // 图标与文字之间的间距
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi Ethan !",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // 1st row
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('sources/N2000.png'), // 替换为你的图片路径
                                        // fit: BoxFit.cover,
                                        scale: 0.2,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: const Text(
                                    'Model: N2000',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // city name
                                Container(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    _weather?.cityName ?? "loading city...",
                                    textAlign: TextAlign.center, // 设置文字居中
                                    style: const TextStyle(fontSize: 20.0), // 设置字体大小
                                  ),
                                ),
                                // weather animation
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                                  width: 80.0, // 设置动画宽度
                                  height: 80.0, // 设置动画高度
                                  child: Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
                                ),
                                // temperature
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                                  child: Text(
                                    '${_weather?.temperature.round()}°C',
                                    style: const TextStyle(fontSize: 20.0), // 设置字体大小
                                  ),
                                ),
                                // weather condition
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                                  child: Text(
                                    _weather?.mainCondition ?? "",
                                    style: const TextStyle(fontSize: 20.0), // 设置字体大小
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 2nd row
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: const Center(
                      child: Text(
                        'to be implemented',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                // 3rd row
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: const Center(
                      child: Text(
                        'to be implemented',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
