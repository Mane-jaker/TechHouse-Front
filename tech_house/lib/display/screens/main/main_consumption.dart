import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_house/display/widgets/main/custom_button.dart';
import 'package:tech_house/display/widgets/main/water_level_chart.dart';
import 'package:firebase_database/firebase_database.dart';

class MainConsuptiom extends StatelessWidget {
  MainConsuptiom({Key? key}) : super(key: key);

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          WaterLevelProgressBar(waterLevel: .3),
          const SizedBox(
            height: 30,
          ),
          const CustomButton(
              icon: Icons.device_thermostat_outlined,
              text: 'Temperatura',
              number: 5,
              unit: '°C'),
          const SizedBox(
            height: 15,
          ),
          const CustomButton(
              icon: Icons.bolt_outlined,
              text: 'Kilowatts',
              number: 5,
              unit: 'KhW'),
          const SizedBox(
            height: 15,
          ),
          const CustomButton(
              icon: Icons.light_mode_outlined,
              text: 'Luminosidad',
              number: 5,
              unit: 'mW')
        ],
      ),
    );
  }
}

/*
void fetchData() {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  // Aquí asumo que 'datos_sensores' es un nodo en tu base de datos.
  dbRef.child('datos_sensores').once().then((DataSnapshot? snapshot) {
    var data = snapshot.value as Map<dynamic, dynamic>?;

    if (data != null) {
      // Los datos están disponibles en snapshot.value

      // Accede a los datos según sea necesario
      double? distancia = data['distancia'] as double?;
      int? humedad = data['humedad'] as int?;
      double? kilowats = data['kilowats'] as double?;
      int? luminosity = data['luminosity'] as int?;
      double? temperatura = data['temperatura'] as double?;

      // Usa los datos según sea necesario
      print('Distancia: $distancia');
      print('Humedad: $humedad');
      print('Kilowats: $kilowats');
      print('Luminosidad: $luminosity');
      print('Temperatura: $temperatura');
    } else {
      print('No hay datos disponibles.');
    }
  }).catchError((error) {
    print('Error al obtener datos: $error');
  });
}

*/