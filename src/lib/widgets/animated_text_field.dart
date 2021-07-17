import 'package:flutter/material.dart';
import '../theme.dart';

// TODO: Add actual function for onTap
// TODO: Removed container height because it warped error message

class AnimatedTextField extends StatelessWidget {
  final double width;
  final EdgeInsetsGeometry margin;
  final FocusNode textNode;
  final TextEditingController fieldController;
  final String fieldLabel;
  final bool isPassword;
  final Function(String input) validator;
  final Function(String input) onSaved;
  final Function(String input) onSubmit;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  AnimatedTextField(
      {Key key,
      @required this.width,
      @required this.margin,
      @required this.textNode,
      @required this.fieldController,
      @required this.fieldLabel,
      this.textInputAction = TextInputAction.done,
      this.textInputType,
      this.validator,
      this.onSaved,
      this.onSubmit,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: TextFormField(
        focusNode: textNode,
        controller: fieldController,
        obscureText: isPassword,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        onTap: () => textNode.requestFocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          labelText: fieldLabel,
          labelStyle: TextStyle(
            color: (textNode.hasFocus || fieldController.text.isNotEmpty)
                ? Colors.white
                : Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: fieldController.text.isEmpty
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 4.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: fieldController.text.isEmpty
                  ? Theme.of(context).errorColor
                  : customCyan,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: fieldController.text.isEmpty
                  ? Theme.of(context).errorColor
                  : customCyan,
              width: 4.0,
            ),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
