import 'package:flutter/material.dart';
import 'package:tech_house/display/screens/main/main_consumption.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double number;
  final String unit; // Añade un nuevo parámetro para la unidad de medida

  const CustomButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.number,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: () {
          //fetchData();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 28.0,
              backgroundColor: const Color(0xFF1C9FE2),
              child: Icon(icon, color: Colors.white, size: 30.0),
            ),
            Text(text,
                style:
                    const TextStyle(fontSize: 20.0, color: Color(0xFF7E7E7E))),
            Text('$number $unit',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(
                        0xFF7E7E7E))), // Muestra el número con su unidad de medida
          ],
        ),
      ),
    );
  }
}
