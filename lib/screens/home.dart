import 'package:flutter/material.dart';

import 'package:mind_space/screens/moodify.dart';
import 'package:mind_space/screens/ai_therapist.dart';
import 'package:mind_space/screens/rehab_community.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40.0),
          Text(
            'Welcome Feroz !',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Moodify()));
                  },
                  child:
                      _Card('MOODIFY', Colors.red, Colors.pink, 120.0, 120.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AiTherapist()));
                  },
                  child: _Card(
                      'AI THERAPIST', Colors.red, Colors.pink, 120.0, 120.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RehabCommunity()));
              },
              child: _Card(
                  'WELLNESS COMMUNITY', Colors.blue, Colors.cyan, 290.0, 200.0),
            ),
          ),
        ],
      ),
    );
  }
}
