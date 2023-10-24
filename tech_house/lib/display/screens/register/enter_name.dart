import 'package:flutter/material.dart';

class EnterName extends StatelessWidget {
  const EnterName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Registrate',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              SizedBox(height: 10),
              Text('Ingresa tu nombre para continuar'),
              SizedBox(height: 20),
            ],
          ),
          const Column(
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Nombree',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail_outline_rounded)),
              ),
              SizedBox(height: 20),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Bienvenido a',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navegar a la página de registro
                    },
                    child: const Text(
                      'TechHouse',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Raleway',
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Acceder
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text(
                  'Siguiente',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
