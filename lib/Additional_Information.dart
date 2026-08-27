import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.water_drop,size: 32,),
        const SizedBox(height: 6,),
        Text('Humidity'),
        const SizedBox(height: 6,),
        Text('94',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
