import 'package:flutter/material.dart';

class WaterLevelProgressBar extends StatelessWidget {
  final double waterLevel;

  WaterLevelProgressBar({super.key, required this.waterLevel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0,6),
              ),
            ],
          ),
          width: 335.0,
          height: 266.0,
          child: RotatedBox(
            quarterTurns: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                value: waterLevel,
                minHeight: 20,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ),
        Text(
          '${(waterLevel * 100).toStringAsFixed(1)}%',
          style: const TextStyle(color: Colors.black, fontSize: 40),
        ),
      ],
    );
  }
}