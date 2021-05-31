import 'package:flutter/material.dart';

import '../size_config.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.45,
        right: SizeConfig.screenWidth * 0.45,
        bottom: 20,
      ),
      color: Colors.grey,
      height: 3,
    );
  }
}
