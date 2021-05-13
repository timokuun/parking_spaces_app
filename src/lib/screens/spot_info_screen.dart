import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../models/Color.dart';
import '../widgets/spot_amenity_label.dart';
import '../widgets/spot_carousel.dart';
import '../widgets/spot_info_box.dart';
import '../widgets/spot_owner_box.dart';
import '../widgets/spot_buy_button.dart';

class SpotInfoScreen extends StatefulWidget {
  SpotInfoScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const String id = '/spot_info';

  @override
  _SpotInfoScreenState createState() => _SpotInfoScreenState();
}

class _SpotInfoScreenState extends State<SpotInfoScreen> {
  final List<Image> spotImages = [
    Image.asset('assets/images/spot1.jpg'),
    Image.asset('assets/images/spot2.jpg'),
    Image.asset('assets/images/spot3.jpg'),
  ];

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 45,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SpotCarousel(devHeight: devHeight),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpotInfoBox(
                      spotTitle: "The Hilton at San Diego L2S4",
                      overallRating: 4.3,
                      totalReviews: 43,
                      spotHeight: 155,
                    ),
                    SpotAmenityLabel(
                      devHeight: devHeight,
                      devWidth: devWidth,
                      backgroundColor: Colors.white,
                      fontColor: OurColor.ourCyan,
                    ),
                    Container(
                      color: Colors.red,
                      height: devHeight * 0.5,
                      width: devWidth * 0.6,
                    ),
                    Container(
                      height: devHeight * 0.6,
                      width: devWidth * 0.7,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(22, 88),
                          zoom: 15,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                    SpotOwnerBox(
                      devHeight: devHeight,
                      devWidth: devWidth,
                      owner: "Thomas",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SpotBuyButton(
              devHeight: devHeight,
              devWidth: devWidth,
              buttonColor: OurColor.ourCyan,
              cost: 7,
            ),
          ),
        ],
      ),
    );
  }
}
