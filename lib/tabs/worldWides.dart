import 'package:flutter/material.dart';

class WorldWide extends StatelessWidget {
  final Map worldData;

  const WorldWide({Key? key, required this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              WorldTexts(
                  num: worldData['todayCases'].toString(),
                  colour: Colors.blueGrey[200],
                  text: 'Cases'),
              WorldTexts(
                  num: worldData['active'].toString(),
                  colour: Colors.orange[200],
                  text: 'Active')
            ],
          ),
          Row(
            children: [
              WorldTexts(
                  num: worldData['todayDeaths'].toString(),
                  colour: Colors.purple[200],
                  text: 'Deaths'),
              WorldTexts(
                  num: worldData['todayRecovered'].toString(),
                  colour: Colors.redAccent[100],
                  text: 'Recovered')
            ],
          )
        ],
      ),
    );
  }
}

class WorldTexts extends StatelessWidget {
  final Color? colour;
  final String text;
  final String num;

  const WorldTexts(
      {Key? key, required this.colour, required this.text, required this.num})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            num,
            textAlign: TextAlign.center,
          )
        ],
      ),
      color: colour,
    ));
  }
}
