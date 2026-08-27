import 'package:flutter/material.dart';
class HourlyForecastSection extends StatelessWidget {
  const HourlyForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('09:00',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 8,),
                Icon(Icons.cloud,size: 32,),
                const SizedBox(height: 8,),
                Text('301.17',),
              ],
            ),
          )
      ),
    );
  }
}