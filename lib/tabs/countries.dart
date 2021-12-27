import 'package:flutter/material.dart';

class Countries extends StatelessWidget {
  final List countryData;

  const Countries({Key? key, required this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => Row(
                children: [
                  Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 30,
                  )
                ],
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
    );
  }
}

class ToPage extends StatelessWidget {
  final String text;

  const ToPage({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.indigo[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.forward,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
