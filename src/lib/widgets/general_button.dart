import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

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
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.sp),
          ),
          primary: Theme.of(context).primaryColor,
          onPrimary: Theme.of(context).backgroundColor,
        ),
        onPressed: onTap,
        child: Text(
          buttonLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
