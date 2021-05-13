import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
