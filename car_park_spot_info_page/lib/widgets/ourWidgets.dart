import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpotCarousel extends StatelessWidget {
  const SpotCarousel({
    Key key,
    @required this.devHeight,
  }) : super(key: key);

  final double devHeight;
  // Determine how we want to "connect" list of images...

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: devHeight * 0.45,
          aspectRatio: 9 / 16,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          autoPlay: false,
        ),
        items: [
          'assets/images/spot1.jpg',
          'assets/images/spot2.jpg',
          'assets/images/spot3.jpg',
        ].map(
          (e) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(e),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

class SpotInfoBox extends StatelessWidget {
  const SpotInfoBox({
    Key key,
    @required this.devWidth,
    @required this.devHeight,
    @required this.overallRating,
    @required this.totalReviews,
    @required this.spotHeight,
  }) : super(key: key);

  final double devWidth;
  final double devHeight;
  final double overallRating;
  final int totalReviews;
  final int spotHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: devWidth * 0.8,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Colors.grey,
          ),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, devHeight * 0.03, 0, devHeight * 0.03),
      padding: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.03),
      child: Column(
        children: [
          Text(
            "Hopkins @ UCSD",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
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
                    size: 30,
                  ),
                  Text(
                    "$overallRating($totalReviews)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: devHeight * 0.06,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
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
                      fontSize: 22,
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

class SpotAmenityLabel extends StatelessWidget {
  const SpotAmenityLabel({
    Key key,
    @required this.devHeight,
    @required this.devWidth,
    @required this.backgroundColor,
    @required this.fontColor,
  }) : super(key: key);

  final double devHeight;
  final double devWidth;
  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: devHeight * 0.045,
      width: devWidth * 0.25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          "Night Lights",
          style: TextStyle(
              color: fontColor, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

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
          Text(
            "Provided by $owner",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

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
