import 'package:flutter/material.dart';

class ChangeDataButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ChangeDataButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: onPressed,
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
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white10),
          ],
        ),
      ),
    );
  }
}