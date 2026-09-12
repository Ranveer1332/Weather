import 'package:flutter/material.dart';
class HourlyForecastSection extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const HourlyForecastSection({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(time,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8,),
                Icon(icon,size: 32,),
                const SizedBox(height: 8,),
                Text(temp),
              ],
            ),
          )
      ),
    );
  }
}