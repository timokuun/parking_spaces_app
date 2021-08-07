import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// TODO: Add actual function for onTap
class AnimatedTextField extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final FocusNode _textNode;
  final TextEditingController fieldController;
  final String fieldLabel;
  final bool isPassword;

  const AnimatedTextField(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.margin,
      @required FocusNode textNode,
      @required this.fieldController,
      @required this.fieldLabel,
      @required this.isPassword})
      : _textNode = textNode,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        onTap: () => _textNode.requestFocus(),
        focusNode: _textNode,
        obscureText: isPassword,
        controller: fieldController,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.all(2.2.h),
          labelText: fieldLabel,
          labelStyle: TextStyle(
            color: (_textNode.hasFocus || fieldController.text.isNotEmpty)
                ? Colors.white
                : Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.circular(2.2.h),
            borderSide: BorderSide(
              color: fieldController.text.isEmpty
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              // width: 2.0,
              width: 2.sp,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              // width: 4.0,
              width: 3.5.sp,
            ),
            // borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.circular(2.2.h),
          ),
        ),
      ),
    );
  }
}
