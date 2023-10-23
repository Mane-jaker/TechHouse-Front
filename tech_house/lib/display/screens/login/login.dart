import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingresar',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Ingresa a la aplicación con tu correo o mediante Gmail'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Iniciar sesión con Google
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Iniciar sesión con Google'),
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 20,
              thickness: 2,
              endIndent: 30,
              indent: 30,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa tu correo',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('No tienes cuenta '),
                TextButton(
                  onPressed: () {
                    // Navegar a la página de registro
                  },
                  child: const Text(
                    'REGISTRATE',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acceder
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              child: const Text('Acceder'),
            ),
          ],
        ),
      ),
    );
  }
}
