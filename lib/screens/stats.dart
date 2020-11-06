import 'package:flutter/material.dart';
import 'package:mind_space/screens/progress.dart';

class Stats extends StatelessWidget {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Progress('Daily')));
            },
            child:
                _Card('Today\'s Report', Colors.red, Colors.pink, 290.0, 200),
          ),
          SizedBox(height: 40.0),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Progress('Weekly')));
            },
            child:
                _Card('Week Wise Report', Colors.blue, Colors.cyan, 290.0, 200),
          ),
        ],
      ),
    );
  }
}
