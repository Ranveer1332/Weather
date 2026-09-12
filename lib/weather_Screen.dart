import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'Additional_Information.dart';
import 'Hourly_Forecast_Section.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'Secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String,dynamic>> weather;

  Future<Map<String,dynamic>> getCurrentWeather() async {
    try {

      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey&units=metric'
        ),
      );
      final data = jsonDecode(res.body);

      if(data['cod'] != '200'){
        throw 'An Unexpected Error Occured';
      }
      return data;

      // data['list'][0]['main']['temp'];

    }
    catch(e){
      throw e.toString();
    }
  }
  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',style: TextStyle(fontWeight: FontWeight.bold
          ),
        ),
        centerTitle:true,
        actions: [
          IconButton(onPressed: (
              ){
            setState(() {
              weather = getCurrentWeather();
            });
          }, icon: const Icon(Icons.refresh),
          )
        ],
      ),
        body : FutureBuilder(
          future: weather,
          builder:(context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }


            final data = snapshot.data!;

            final currentWeatherData = data['list'][0];
            final currentTemp = currentWeatherData['main']['temp'];
            final currentSky = currentWeatherData ['weather'][0]['main'];
            final currentPressure = currentWeatherData['main']['pressure'];
            final currentWind = currentWeatherData['wind']['speed'];
            final currentHumidity = currentWeatherData['main']['humidity'];

            return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text('$currentTemp °C',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              const SizedBox(height: 16,),
                              Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'? Icons.cloud : Icons.sunny,
                                size: 64
                              ),
                              const SizedBox(height: 16,),
                              Text(currentSky,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //weather forecast card
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Weather Forecast',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
                const SizedBox(height: 15,),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for(int i=0;i<5;i++)
                //       HourlyForecastSection(
                //         time: data['list'][i+1]['dt'].toString(),
                //         icon: data['list'][i+1]['weather'][0]['main'] == 'Clouds'|| data['list'][i+1]['weather'][0]['main'] == 'Rain'? Icons.cloud: Icons.sunny,
                //         temp: data['list'][i+1]['main']['temp'].toString(),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index){
                      final hourlyForecast = data['list'][index+1];
                      final time = DateTime.parse(hourlyForecast['dt_txt']);
                        return HourlyForecastSection(
                                  time: DateFormat.j().format(time),
                                  icon: hourlyForecast['weather'][0]['main'] == 'Clouds' || hourlyForecast['weather'][0]['main'] == 'Rain' ? Icons.cloud : Icons.sunny,
                                  temp: hourlyForecast['main']['temp'].toString(),
                        );
                      },

                  ),
                ),
                //Additional Information
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Additional Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInformation(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: currentHumidity.toString(),
                    ),
                    AdditionalInformation(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: currentWind.toString(),
                    ),
                    AdditionalInformation(
                      icon: Icons.beach_access,
                      label: 'Pressure',
                      value: currentPressure.toString(),
                    ),
                  ],
                )
                  ],
            ),
          );
          },
        ),
      );
  }
}





