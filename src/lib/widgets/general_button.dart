import 'package:flutter/material.dart';

import '../size_config.dart';

class GeneralButton extends StatelessWidget {
  final String buttonLabel;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final Function onTap;

  const GeneralButton({
    Key key,
    @required this.buttonLabel,
    @required this.height,
    @required this.width,
    this.margin,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
              SizeConfig.screenWidth * 0.3, SizeConfig.screenHeight * 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: Theme.of(context).primaryColor,
          onPrimary: Theme.of(context).backgroundColor,
        ),
        onPressed: onTap,
        child: Text(
          buttonLabel,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
