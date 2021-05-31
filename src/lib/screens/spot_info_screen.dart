import 'package:car_park_login/models/parking_spot.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../size_config.dart';

import '../models/Color.dart';
import '../widgets/spot_amenity_label.dart';
import '../widgets/spot_carousel.dart';
import '../widgets/spot_info_box.dart';
import '../widgets/spot_owner_box.dart';
import '../widgets/spot_buy_button.dart';

class SpotInfoScreen extends StatefulWidget {
  SpotInfoScreen({
    Key key,
    @required this.spot,
    @required this.bought,
  }) : super(key: key);

  final ParkingSpot spot;
  final bool bought;
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
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   leading: InkWell(
        //     splashColor: Theme.of(context).primaryColor,
        //     borderRadius: BorderRadius.circular(30),
        //     onTap: () => Navigator.of(context).pop(),
        //     child: Icon(
        //       Icons.chevron_left,
        //       color: Colors.white,
        //       size: 45,
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      SpotCarousel(
                        images: widget.spot.spotImages,
                        height: SizeConfig.screenHeight * 0.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  // TODO: This crashes app, not needed yet...
                                  //Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.chevron_left,
                                  size: 60,
                                  color: Theme.of(context).primaryColor,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpotInfoBox(
                        spot: widget.spot,
                      ),
                      // TODO: make a mapping for this, ParkingSpot will need list of strings for amenities
                      SpotAmenityLabel(
                        name: "Lights",
                        height: SizeConfig.screenHeight * 0.045,
                        width: SizeConfig.screenWidth * 0.25,
                        backgroundColor: Colors.white,
                        fontColor: OurColor.ourCyan,
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.6,
                        width: SizeConfig.screenWidth * 0.7,
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
                      // TODO: Each parking spot shall have owner property?
                      SpotOwnerBox(
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth,
                        owner: "Thomas",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (!widget.bought)
              Align(
                alignment: Alignment.bottomCenter,
                child: SpotBuyButton(
                  height: SizeConfig.screenHeight * 0.065,
                  width: SizeConfig.screenWidth * 0.8,
                  buttonColor: OurColor.ourCyan,
                  cost: widget.spot.price,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
