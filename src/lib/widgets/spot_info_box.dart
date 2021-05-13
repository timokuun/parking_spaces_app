import 'package:flutter/material.dart';

class SpotInfoBox extends StatelessWidget {
  const SpotInfoBox({
    Key key,
    @required this.spotTitle,
    @required this.overallRating,
    @required this.totalReviews,
    @required this.spotHeight,
  }) : super(key: key);

  final String spotTitle;
  final double overallRating;
  final int totalReviews;
  final int spotHeight;

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Container(
      width: devWidth * 0.8,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, devHeight * 0.03, 0, devHeight * 0.03),
      padding: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.03),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              "$spotTitle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: devHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.cyan,
                    size: 35,
                  ),
                  Text(
                    "$overallRating($totalReviews)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: devHeight * 0.05,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Max Height",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${spotHeight}cm",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
