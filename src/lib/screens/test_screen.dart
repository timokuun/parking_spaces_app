import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(devWidth * 0.2),
              color: Colors.red,
              child: Text('Main Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
