import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget destination;

  const CustomButton({super.key, required this.icon, required this.text, required this.destination});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
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
            Text(text, style: const TextStyle(fontSize: 20.0, color: Color(0xFF7E7E7E))),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF7E7E7E)),
          ],
        ),
      ),
    );
  }
}