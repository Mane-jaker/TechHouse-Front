import 'package:flutter/material.dart';
import 'package:tech_house/display/widgets/main/custom_buttons_links.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  final List<Widget> _buttons = [
    CustomButtonLinks(icon: Icons.device_thermostat_outlined, text: 'Temperatura'),
    const SizedBox(height: 15,),
  ];

  void _addButton(String sensorName, IconData icon) {
    setState(() {
      _buttons.add(CustomButtonLinks(icon: icon, text: sensorName));
      _buttons.add(const SizedBox(height: 15,));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: _buttons,
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
                      title: const Text('Sensor 1'),
                      onTap: () {
                        _addButton('Sensor 1', Icons.device_thermostat_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor 2'),
                      onTap: () {
                        _addButton('Sensor 2', Icons.device_thermostat_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor 3'),
                      onTap: () {
                        _addButton('Sensor 3', Icons.device_thermostat_outlined);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Sensor 4'),
                      onTap: () {
                        _addButton('Sensor 4', Icons.device_thermostat_outlined);
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