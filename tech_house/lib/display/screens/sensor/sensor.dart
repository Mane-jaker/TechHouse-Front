import 'package:flutter/material.dart';
import 'package:tech_house/display/widgets/main/custom_buttons_links.dart';

class Sensor extends StatefulWidget {
  const Sensor({super.key});

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  final Map<String, Widget> _buttons = {};

  void _addButton(String sensorName, IconData icon) {
    final button = GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Eliminar $sensorName'),
              content: Text('¿Estás seguro de que quieres eliminar $sensorName?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Eliminar'),
                  onPressed: () {
                    setState(() {
                      _buttons.remove(sensorName);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
        child: Column(
          children: <Widget>[
            CustomButtonLinks(icon: icon, text: sensorName),
            SizedBox(height: 15,),
          ],
        )
    );
    setState(() {
      _buttons[sensorName] = button;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: _buttons.values.toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Selecciona un sensor'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Sensor Temp y Hum.'),
                      onTap: () {
                        _addButton('Temp y Hum.', Icons.device_thermostat_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor Tinaco.'),
                      onTap: () {
                        _addButton('Tinaco.', Icons.water_drop_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor Corriente.'),
                      onTap: () {
                        _addButton('Corriente.', Icons.bolt_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor Luminosidad.'),
                      onTap: () {
                        _addButton('Luminosidad.', Icons.light_mode_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add), // Icono del botón
        backgroundColor: Color(0xFF71C3F5), // Color del botón
      ),
    );
  }
}
