import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/spotsList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: "Comic Sans",
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(
                0, deviceHeight * 0.04, 0, deviceHeight * 0.020),
            child: Text(
              "My Active Spots",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 35,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0, 0, 0, deviceHeight * 0.01),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "6 Active Spots",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SpotsList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.cyan,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: FaIcon(FontAwesomeIcons.map),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.car),
            label: "Parked",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
