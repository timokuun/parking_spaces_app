import 'package:flutter/material.dart';

import '../size_config.dart';

class SpotOwnerBox extends StatelessWidget {
  final String owner;

  const SpotOwnerBox({
    Key key,
    @required this.owner,
  }) : super(key: key);

  // TODO: How should we externalize the dimensions? width used for a lot...(21,37)

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // height: SizeConfig.screenHeight * 0.2,
      // width: SizeConfig.screenWidth,
      height: SizeConfig.proportionalHeight * 20,
      width: SizeConfig.proportionalWidth * 100,
      margin: EdgeInsets.only(
        // top: SizeConfig.screenHeight * 0.04,
        // bottom: SizeConfig.screenHeight * 0.12,
        top: SizeConfig.proportionalHeight * 4,
        bottom: SizeConfig.proportionalHeight * 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(15),
            // height: SizeConfig.screenWidth * 0.18,
            // width: SizeConfig.screenWidth * 0.18,
            height: SizeConfig.proportionalHeight * 9,
            width: SizeConfig.proportionalWidth * 18,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Provided by $owner",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
