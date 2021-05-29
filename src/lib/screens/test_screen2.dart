import 'package:flutter/material.dart';

class TestScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
