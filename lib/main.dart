import 'package:flutter/material.dart';

import 'package:mind_space/screens/home.dart';
import 'package:mind_space/screens/stats.dart';
import 'package:mind_space/screens/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

List<String> TITLES = [
  'Your Progress',
  'Home',
  'Profile',
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;
  final List<Widget> _children = [
    Stats(),
    Home(),
    Profile(),
  ];

  void onTabTapped(int idx) {
    setState(() {
      _index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLES[_index]),
        centerTitle: true,
        backgroundColor: Color(0xffbbf55ec),
      ),
      body: _children[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('Me'),
          ),
        ],
      ),
    );
  }
}
