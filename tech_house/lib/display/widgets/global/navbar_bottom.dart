import 'package:flutter/material.dart';
import 'package:tech_house/display/screens/Options/options.dart';
import 'package:tech_house/display/screens/charts/charts.dart';
import 'package:tech_house/display/screens/main/main_consumption.dart';

import '../../screens/sensor/sensor.dart';

class NavbarBottom extends StatefulWidget {
  const NavbarBottom({super.key});

  @override
  State<NavbarBottom> createState() => _NavBarState();
}

class _NavBarState extends State<NavbarBottom> {
  int pagenumber = 0;

  List pages = <Widget>[
    const MainConsuptiom(),
    const Charts(),
    const Sensor(),
    const Options()
  ];

  void onItemTapped(int index) {
    setState(() {
      pagenumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<String> pageTitles = ['Home', 'Graphic', 'Links', 'Options'];


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pageTitles[pagenumber],
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: pages[pagenumber],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phonelink_ring_outlined),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Options',
          ),
        ],
        currentIndex: pagenumber,
        onTap: onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
