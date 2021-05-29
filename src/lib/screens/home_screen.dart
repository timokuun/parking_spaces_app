import 'dart:async';
import 'package:car_park_login/widgets/garage_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/parking_garage.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  List<ParkingGarage> garageResults = [];

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    double miles = 1.1;
    int availSpots = 500;
    int lowPrice = 100;
    int highPrice = 200;

    ScrollController singleChildSrollController = new ScrollController();

    // TODO: NEVER MIND => Indicator still gets pushed up
    return SafeArea(
      // TODO: Can we make status bar transparent?
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.773972, -122.431297),
                zoom: 15,
              ),
              // onMapCreated: (GoogleMapController controller) {
              //   _controller.complete(controller);
              // },
            ),
            // Search Bar
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: SearchBar(
                  searchNode: _searchNode,
                  searchController: _searchController,
                  height: devHeight * 0.06,
                  width: devWidth * 0.88,
                  margin: EdgeInsets.only(
                    top: 25,
                    bottom: 5,
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.45,
              maxChildSize: 0.9,
              minChildSize: 0.10,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  // Prevent List View from overflowing DSS
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: SingleChildScrollView(
                    // controller: scrollController,
                    controller: singleChildSrollController,
                    // padding: EdgeInsets.only(
                    //   top: 20,
                    // ),
                    child: Column(children: [
                      Container(
                        height: devHeight * 0.8,
                        child: ListView.separated(
                          controller: scrollController,
                          // Override the default padding value
                          padding: EdgeInsets.only(
                            top: 30,
                          ),
                          separatorBuilder: (_, __) => Divider(
                            height: 30,
                          ),
                          itemBuilder: (context, index) {
                            // NOTE: First item is the Draggable indicator
                            return index == 0
                                ? // Draggable indicator
                                Container(
                                    margin: EdgeInsets.only(
                                      left: devWidth * 0.45,
                                      right: devWidth * 0.45,
                                      bottom: 25,
                                    ),
                                    color: Colors.grey,
                                    // width: 30,
                                    height: 3,
                                  )
                                : GarageResult(
                                    miles: miles,
                                    availableSpots: availSpots,
                                    lowPrice: lowPrice,
                                    highPrice: highPrice,
                                    garage: result[0],
                                  );
                          },
                          // TODO: This "8" is only temporary
                          // ITEMCOUNT has to be the length + 1 (including indicator)
                          itemCount: 8,
                        ),
                      ),
                    ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
