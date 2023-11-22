import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  bool isSwitched = false;
  final colita = 5.5;

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
        Text('Consumo total', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 30,),
        Container(
          width: 400,
          height: 300,
          child: isSwitched ? _buildLineChart() : _buildBarChart(),
        ),
        // Resto de tu código
      ],
    );
  }

  Widget _buildBarChart() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Título de la Gráfica', style: Theme.of(context).textTheme.headline4),
          BarChart(
            BarChartData(
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData( toY: colita, color: Colors.lightBlueAccent, width: 25)
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildLineChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData( toY: 5, color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(toY: 7, color: Colors.lightBlueAccent, width: 25)
            ],
          ),
        ],
      ),
    );
  }
