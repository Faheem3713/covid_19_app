// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:covid_19/constants.dart';
import 'package:covid_19/tabs/countries.dart';
import 'package:covid_19/tabs/worldWides.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map data;
  fetchData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    setState(() {
      data = json.decode(response.body);
    });
  }

  late List countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    setState(() {
      countryData = json.decode(response.body);
      var coun = countryData[10]['countryInfo'];
    });
  }

  @override
  void initState() {
    fetchData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Tracker'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: Text(
              Datas().headText,
              textAlign: TextAlign.center,
            ),
            color: Colors.blue[100],
          ),
          TextHeading(
            text: 'World Wide',
          ),
          WorldWide(
            worldData: data,
          ),
          SizedBox(
            height: 35,
          ),
          ToPage(
            text: 'Countries List',
          ),
          ToPage(text: 'FAQ')
        ],
      ),
    );
  }
}

class TextHeading extends StatelessWidget {
  final String text;

  const TextHeading({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
