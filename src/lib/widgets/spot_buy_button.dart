import 'package:flutter/material.dart';

// TODO: Add onTap function
class SpotBuyButton extends StatelessWidget {
  final Color buttonColor;
  final double height;
  final double width;
  final double cost;

  const SpotBuyButton({
    Key key,
    @required this.height,
    @required this.width,
    @required this.cost,
    @required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          primary: buttonColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RENT FROM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
                Text(
                  "\$$cost / hour",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
