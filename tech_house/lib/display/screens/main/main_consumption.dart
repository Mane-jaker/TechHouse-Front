import 'package:flutter/material.dart';
import 'package:tech_house/display/widgets/main/custom_button.dart';
import 'package:tech_house/display/widgets/main/water_level_chart.dart';

class MainConsuptiom extends StatelessWidget {
  const MainConsuptiom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          WaterLevelProgressBar(waterLevel: .2),
          const SizedBox(height: 30,),
          const CustomButton(icon: Icons.device_thermostat_outlined, text: 'Temperatura', number: 5, unit: '°C'),
          const SizedBox(height: 15,),
          const CustomButton(icon: Icons.bolt_outlined, text: 'Kilowatts', number: 5, unit: 'KhW'),
          const SizedBox(height: 15,),
          const CustomButton(icon: Icons.light_mode_outlined, text: 'Luminosidad', number: 5, unit: 'mW')
        ],
      ),
    );
  }
}
