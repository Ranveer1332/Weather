import 'package:flutter/material.dart';
class HourlyForecastSection extends StatelessWidget {
  final String value;
  final IconData icon;
  final String label;
  const HourlyForecastSection({
    super.key,
    required this.value,
    required this.icon,
    required this.label,
});

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
                Text(value,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 8,),
                Icon(icon,size: 32,),
                const SizedBox(height: 8,),
                Text(label),
              ],
            ),
          )
      ),
    );
  }
}