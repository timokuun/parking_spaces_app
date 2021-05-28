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
            DraggableScrollableSheet(
              initialChildSize: 0.05,
              maxChildSize: 0.9,
              minChildSize: 0.05,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(children: [
                      // Draggable indicator
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 0,
                        ),
                        color: Colors.grey,
                        width: 40,
                        height: 3,
                      ),
                      // Search Bar
                      Align(
                        alignment: Alignment.topCenter,
                        child: SearchBar(
                          searchNode: _searchNode,
                          searchController: _searchController,
                          customHeight: devHeight * 0.045,
                          customWidth: devWidth * 0.75,
                          customMargin: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                      ),
                      Container(
                        height: devHeight * 0.8,
                        child: ListView.separated(
                          controller: scrollController,
                          // Override the default padding value
                          padding: EdgeInsets.only(
                            top: 30,
                          ),
                          separatorBuilder: (_, __) => Divider(
                            height: 20,
                            thickness: 1,
                            indent: 100,
                            endIndent: 100,
                          ),
                          itemBuilder: (context, index) {
                            return GarageResult(
                              miles: miles,
                              availableSpots: availSpots,
                              lowPrice: lowPrice,
                              highPrice: highPrice,
                              garage: result[0],
                            );
                          },
                          // TODO: This "8" is only temporary
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            setState(() {});
          },
          showUnselectedLabels: true,
          selectedItemColor: Colors.cyan,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: FaIcon(
                FontAwesomeIcons.map,
                size: 15,
              ),
              label: "Maps",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.search,
                size: 15,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.car,
                size: 15,
              ),
              label: "Parked",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.heart,
                size: 15,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userCircle,
                size: 15,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
