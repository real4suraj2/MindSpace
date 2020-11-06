import 'package:flutter/material.dart';

class Moodify extends StatelessWidget {
  Widget _Card(
      String title, Color clr1, Color clr2, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.3, 1],
          colors: [clr1, clr2],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moodify'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Card('Feature A', Colors.grey, Colors.grey, 290, 200.0),
            SizedBox(height: 40.0),
            _Card('Feature B', Colors.grey, Colors.grey, 290, 200.0),
          ],
        ),
      ),
    );
  }
}
