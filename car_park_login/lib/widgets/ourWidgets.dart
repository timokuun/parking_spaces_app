import 'package:flutter/material.dart';

class OurButton extends StatelessWidget {
  const OurButton(
      {Key key, @required this.devWidth, @required this.buttonLabel})
      : super(key: key);

  final double devWidth;
  final String buttonLabel;

  // Later add function for onPressed

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(devWidth * 0.3, devWidth * 0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).backgroundColor,
      ),
      onPressed: () {},
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class OurTextField extends StatelessWidget {
  const OurTextField(
      {Key key,
      @required FocusNode passNode,
      @required this.fieldController,
      @required this.fieldLabel,
      @required this.isPassword})
      : _passNode = passNode,
        super(key: key);

  final FocusNode _passNode;
  final TextEditingController fieldController;
  final fieldLabel;
  final isPassword;

  // Add an ACTUAL function for onTap

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      onTap: () => _passNode.requestFocus(),
      focusNode: _passNode,
      obscureText: isPassword,
      controller: fieldController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        labelText: fieldLabel,
        labelStyle: TextStyle(
          color: (_passNode.hasFocus || fieldController.text.isNotEmpty)
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
      ),
    );
  }
}
