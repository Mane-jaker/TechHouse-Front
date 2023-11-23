import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tech_house/display/widgets/main/custom_button.dart';
import 'package:tech_house/display/widgets/main/water_level_chart.dart';

class MainConsuptiom extends StatefulWidget {
  const MainConsuptiom({Key? key}) : super(key: key);

  @override
  _MainConsuptiomState createState() => _MainConsuptiomState();
}

class _MainConsuptiomState extends State<MainConsuptiom> {
  late Stream<DatabaseEvent> streamData;
  Stream<DatabaseEvent> streamDataKey = Stream.empty();

  @override
  void initState() {
    super.initState();
    streamData = FirebaseDatabase.instance
        .ref('datos_sensores')
        .orderByKey()
        .limitToLast(1)
        .onValue;

    streamData.listen((DatabaseEvent event) {
      // Obtén el último ID
      Object? values = event.snapshot.value;
      String valuesString = values.toString();
      RegExp regExp = RegExp(r'-\w{19}');
      String key = regExp.stringMatch(valuesString)!;
      print('Last Key: $key');

      // Usa el último ID para obtener los datos
      setState(() {
        streamDataKey = FirebaseDatabase.instance.ref('datos_sensores/$key').onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: streamDataKey,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Aquí puedes acceder a los datos de Firebase
          var data = (snapshot.hasData && snapshot.data!.snapshot.value != null)
              ? Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map)
              : null;

          return Center(
            child: Column(
              children: [
                data != null ? WaterLevelProgressBar(waterLevel: data['distancia'] / 1000) : Container(),  // Verifica si data es null antes de usarlo
                const SizedBox(height: 30,),
                data != null ? CustomButton(icon: Icons.device_thermostat_outlined, text: 'Temperatura', number: data['temperatura'].toDouble(), unit: '°C') : Container(),  // Verifica si data es null antes de usarlo
                const SizedBox(height: 15,),
                data != null ? CustomButton(icon: Icons.bolt_outlined, text: 'Kilowatts', number: data['kilowats'].toDouble(), unit: 'KhW') : Container(),  // Verifica si data es null antes de usarlo
                const SizedBox(height: 15,),
                data != null ? CustomButton(icon: Icons.light_mode_outlined, text: 'Luminosidad', number: data['luminosity'].toDouble(), unit: 'mW') : Container()  // Verifica si data es null antes de usarlo
              ],
            ),
          );
        }
      },
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