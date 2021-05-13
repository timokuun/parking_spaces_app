import 'package:flutter/material.dart';

class SpotOwnerBox extends StatelessWidget {
  const SpotOwnerBox({
    Key key,
    @required this.devHeight,
    @required this.devWidth,
    @required this.owner,
  }) : super(key: key);

  final double devHeight;
  final double devWidth;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: devHeight * 0.2,
      width: devWidth,
      margin: EdgeInsets.fromLTRB(0, devHeight * 0.04, 0, devHeight * 0.12),
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
            height: devWidth * 0.18,
            width: devWidth * 0.18,
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
