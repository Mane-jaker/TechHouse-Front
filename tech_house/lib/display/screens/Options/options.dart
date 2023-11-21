import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int _currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white, size: 55.0),
            radius: 55.0,
          ),
          SizedBox(height: 25,),
          Text(
            'Esteban Rivera',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50,),
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _currentIndex = _currentIndex == index ? -1 : index;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Datos de la cuenta'),
                  );
                },
                body: Column(
                  children: [
                    // Aquí puedes agregar el contenido que se mostrará cuando se expanda 'Datos de la cuenta'
                  ],
                ),
                isExpanded: _currentIndex == 0,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Notificaciones'),
                  );
                },
                body: Column(
                  children: [
                    // Aquí puedes agregar el contenido que se mostrará cuando se expanda 'Notificaciones'
                  ],
                ),
                isExpanded: _currentIndex == 1,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Sensores'),
                  );
                },
                body: Column(
                  children: [
                    // Aquí puedes agregar el contenido que se mostrará cuando se expanda 'Sensores'
                  ],
                ),
                isExpanded: _currentIndex == 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}