
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/main/change_data_button.dart';
import 'dart:async';
import 'dart:math';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  bool isSwitched = false;
  bool consumAgua = true;
  List<double> valuesA = [1.5, 1, 1, 1];
  List<double> valuesE = [1.5, 1, 1, 1];
  List<double> valuesCA = [1.5, 1, 1, 1];
  List<double> valuesCE = [1.5, 1, 1, 1];
  Random random = Random();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => generateData());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void generateData() {
    double agua = random.nextDouble() * 10;
    double energia = random.nextDouble() * 10;

    print(agua);
    print(energia);

    setState(() {
      valuesA = [...valuesA.sublist(1), agua];
      valuesE = [...valuesE.sublist(1), energia];
      valuesCA = [...valuesCA.sublist(1), (valuesCA.last + agua)];
      valuesCE = [...valuesCE.sublist(1), (valuesCE.last + energia)];
    });
  }

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
              consumAgua = true;
            });
          },
        ),
        SizedBox(height: 15,),
        ChangeDataButton(
          icon: Icons.bolt_outlined,
          text: 'Consu. Electrico',
          onPressed: () {
            setState(() {
              consumAgua = false;
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
              BarChartRodData(toY: consumAgua ? valuesA[0] : valuesE[0], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY:consumAgua ? valuesA[1] : valuesE[1], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(toY: consumAgua ? valuesA[2] : valuesE[2], color: Colors.lightBlueAccent, width: 25)
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(toY: consumAgua ? valuesA[3] : valuesE[3], color: Colors.lightBlueAccent, width: 25)
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
              FlSpot(0, consumAgua ? valuesCA[0] : valuesCE[0]),
              FlSpot(1, consumAgua ? valuesCA[1] : valuesCE[1]),
              FlSpot(2, consumAgua ? valuesCA[2] : valuesCE[2]),
              FlSpot(3, consumAgua ? valuesCA[3] : valuesCE[3]),
            ],
            color: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
