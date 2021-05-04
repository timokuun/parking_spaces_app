import 'dart:async';
import 'package:car_park_spot_info_page/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/ourWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spot Info Page',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: kCyan,
      ),
      home: MyHomePage(title: 'Spot Info Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.white,
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
                      devWidth: devWidth,
                      devHeight: devHeight,
                      overallRating: 4.3,
                      totalReviews: 43,
                      spotHeight: 155,
                    ),
                    SpotAmenityLabel(
                      devHeight: devHeight,
                      devWidth: devWidth,
                      backgroundColor: Colors.white,
                      fontColor: kCyan,
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
              buttonColor: kCyan,
              cost: 7,
            ),
          ),
        ],
      ),
    );
  }
}
