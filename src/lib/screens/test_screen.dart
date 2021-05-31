import 'package:flutter/material.dart';

import '../size_config.dart';

class TestScreen extends StatefulWidget {
  static const String id = '/test';
  final List<String> backgrounds;

  TestScreen({this.backgrounds});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int curr = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  curr = (curr + 1) % widget.backgrounds.length;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(SizeConfig.screenWidth * 0.2),
                child: Text('Garage Page'),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.backgrounds[curr]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
