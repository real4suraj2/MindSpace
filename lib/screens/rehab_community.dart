import 'package:flutter/material.dart';
import 'package:mind_space/screens/chat_room.dart';

class RehabCommunity extends StatelessWidget {
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
        title: Text('Wellness Community'),
        backgroundColor: Color(0xffb22a7f0),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Choose a goal !',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatRoom('Develop Gratitute', Colors.pink)));
              },
              child: _Card(
                  'Develop Gratitude', Colors.red, Colors.pink, 280.0, 70.0),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatRoom('Deal With Anxiety', Colors.blue)));
              },
              child: _Card(
                  'Deal With Anxiety', Colors.blue, Colors.cyan, 280.0, 70.0),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatRoom('Deal With Loss', Colors.pink)));
              },
              child:
                  _Card('Deal With Loss', Colors.red, Colors.pink, 280.0, 70.0),
            ),
          ],
        ),
      ),
    );
  }
}
