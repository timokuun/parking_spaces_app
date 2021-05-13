import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotBuyButton extends StatelessWidget {
  const SpotBuyButton({
    Key key,
    @required this.devHeight,
    @required this.devWidth,
    @required this.cost,
    @required this.buttonColor,
  }) : super(key: key);

  final Color buttonColor;
  final double devHeight;
  final double devWidth;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      height: devHeight * 0.08,
      width: devWidth * 0.75,
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
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$${cost} / hour",
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
              child: FaIcon(
                FontAwesomeIcons.shoppingBasket,
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
