import 'package:flutter/material.dart';

import '../size_config.dart';

class TestScreen2 extends StatelessWidget {
  static const String id = '/test2';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.screenWidth * 0.2),
              color: Colors.green,
              child: Text('Spot info Page'),
            ),
          ],
        ),
      ),
    );
  }
}
