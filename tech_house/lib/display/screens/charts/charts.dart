
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widgets/main/change_data_button.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  bool isSwitched = false;
  List<double> values = [5.5, 7, 7, 7];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Barras'),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: isSwitched,
                activeColor: Colors.lightBlueAccent,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
            Text('Poligono'),
          ],
        ),
        Text('Consumo total', style: Theme
            .of(context)
            .textTheme
            .headline6),
        SizedBox(height: 30,),
        Container(
          width: 400,
          height: 300,
          child: isSwitched ? _buildLineChart() : _buildBarChart(),
        ),
        SizedBox(height: 30,),
        ChangeDataButton(
          icon: Icons.water_drop_outlined,
          text: 'Consu. Agua',
          onPressed: () {
            setState(() {
              values = [3, 4, 5, 6];  // Cambia esto por los valores que quieras
            });
          },
        ),
        SizedBox(height: 15,),
        ChangeDataButton(
          icon: Icons.bolt_outlined,
          text: 'Consu. Electrico',
          onPressed: () {
            setState(() {
              values = [6, 5, 4, 3];  // Cambia esto por los valores que quieras
            });
          },
        )
      ],
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: values[0], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY: values[1], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(toY: values[2], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(toY: values[3], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, values[0]),
              FlSpot(1, values[1]),
              FlSpot(2, values[2]),
              FlSpot(3, values[3]),
            ],
            color: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
