import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

import '../models/parkingSpot.dart';

class SpotCarousel extends StatefulWidget {
  const SpotCarousel({
    Key key,
    @required this.devHeight,
  }) : super(key: key);

  final double devHeight;

  @override
  _SpotCarouselState createState() => _SpotCarouselState();
}

class _SpotCarouselState extends State<SpotCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: widget.devHeight * 0.4,
              aspectRatio: 1.3,
              viewportFraction: 1,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: [
              'assets/images/spot1.jpg',
              'assets/images/spot2.jpg',
              'assets/images/spot4.jpg',
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
                        borderRadius: BorderRadius.circular(0),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: spots1.map((url) {
            int index = spots1.indexOf(url);
            return Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
