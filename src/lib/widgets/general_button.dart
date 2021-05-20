import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key key,
    @required this.buttonLabel,
    @required this.height,
    @required this.width,
    this.margin,
    @required this.onTap,
  }) : super(key: key);

  final String buttonLabel;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(deviceSize.width * 0.3, deviceSize.height * 0.06),
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
