import 'dart:ui';
import 'package:flutter/material.dart';

import 'Additional_Information.dart';
import 'Hourly_Forecast_Section.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',style: TextStyle(fontWeight: FontWeight.bold
          ),
        ),
        centerTitle:true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh),
          )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //main card
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('300 K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            const SizedBox(height: 16,),
                            Icon(Icons.cloud,
                              size: 64
                            ),
                            const SizedBox(height: 16,),
                            Text('Rain',
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
                alignment: AlignmentGeometry.centerLeft,
                child: Text('Weather Forecast',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForecastSection(),
                    HourlyForecastSection(),
                    HourlyForecastSection(),
                    HourlyForecastSection(),
                  ],
                ),
              ),

              //Additional Information
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerLeft,
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
                  AdditionalInformation(),
                  AdditionalInformation(),
                  AdditionalInformation(),
                ],
              )
                ],
          ),
        ),
      );
  }
}





