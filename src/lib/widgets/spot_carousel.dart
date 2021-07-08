import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

import '../models/parking_spot.dart';

class SpotCarousel extends StatefulWidget {
  final double height;
  final List<String> images;

  const SpotCarousel({
    Key key,
    @required this.height,
    @required this.images,
  }) : super(key: key);

  @override
  _SpotCarouselState createState() => _SpotCarouselState();
}

class _SpotCarouselState extends State<SpotCarousel> {
  int _current = 0;

  // TODO: Correct the page indicator for spot pictures
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: CarouselSlider(
            options: CarouselOptions(
              height: widget.height,
              aspectRatio: 1.3,
              viewportFraction: 1,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: widget.images.map(
              (e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
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
          children: widget.images.map((url) {
            int index = widget.images.indexOf(url);
            return Container(
              width: 6.0,
              height: 6.0,
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
