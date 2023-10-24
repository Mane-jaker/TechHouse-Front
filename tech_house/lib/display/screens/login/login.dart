import 'package:flutter/material.dart';
import 'package:tech_house/display/screens/register/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final bool isRegistering = false;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TechHouse"),
        actions: [
          // Mostrar el botón de retroceso solo en la página de registro
          if (isRegistering)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Navegar atrás en el Navigator
                _navigatorKey.currentState?.pop();
              },
            ),
        ],
      ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          if (isRegistering) {
            // Ruta para la página de registro
            return MaterialPageRoute(
              builder: (context) {
                return const Register();
              },
            );
          } else {
            // Ruta para la página de inicio de sesión
            return MaterialPageRoute(
              builder: (context) {
                return LoginContent(
                  isRegistering: isRegistering,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key, required this.isRegistering});

  final bool isRegistering;

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
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
                'Ingresar',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              SizedBox(height: 10),
              Text('Ingresa a la aplicación con tu correo o mediante Gmail'),
              SizedBox(height: 20),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: double
                    .infinity, // Hace que el Container ocupe todo el ancho
                child: ElevatedButton(
                  onPressed: () {
                    // Iniciar sesión con Google
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text(
                    'Iniciar sesión con Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 20,
                thickness: 2,
                endIndent: 10,
                indent: 10,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Ingresa tu correo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail_outline_rounded)),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'No tienes cuenta?',
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
                      'Registrate',
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text(
                  'Acceder',
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
