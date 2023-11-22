import 'package:flutter/material.dart';

class CustomButtonLinks extends StatefulWidget {
  final IconData icon;
  final String text;

  const CustomButtonLinks({super.key, required this.icon, required this.text});

  @override
  _CustomButtonLinksState createState() => _CustomButtonLinksState();
}

class _CustomButtonLinksState extends State<CustomButtonLinks> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.0,
      height: 80.0,
      child: ElevatedButton(
        onPressed: () {

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
              child: Icon(widget.icon, color: Colors.white, size: 30.0),
            ),
            Text(widget.text, style: const TextStyle(fontSize: 20.0, color: Color(0xFF7E7E7E))),
            Switch(
              value: _value,
              onChanged: (bool value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}