import 'package:flutter/material.dart';

class SpotOwnerBox extends StatelessWidget {
  final double height;
  final double width;
  final String owner;

  const SpotOwnerBox({
    Key key,
    @required this.height,
    @required this.width,
    @required this.owner,
  }) : super(key: key);

  // TODO: How should we externalize the dimensions? width used for a lot...(21,37)

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      width: width,
      margin: EdgeInsets.only(
        top: height * 0.04,
        bottom: height * 0.12,
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
            height: width * 0.18,
            width: width * 0.18,
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
