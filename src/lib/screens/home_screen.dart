import 'dart:async';
import 'package:car_park_login/widgets/garage_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/parkingSpot.dart';
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
    // TODO: Look into keyboard making "results" drawer move up
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.773972, -122.431297),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.12,
            maxChildSize: 0.7,
            minChildSize: 0.12,
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
                  child: Column(
                    children: [
                      // Draggable indicator
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                        color: Colors.grey,
                        width: 40,
                        height: 3,
                      ),
                      // Search Bar
                      Container(
                        margin: EdgeInsets.only(
                          top: 2,
                          bottom: 5,
                        ),
                        height: devHeight * 0.045,
                        width: devWidth * 0.75,
                        child: SearchBar(
                          searchNode: _searchNode,
                          searchController: _searchController,
                        ),
                      ),
                      // List View
                      Container(
                        height: devHeight * 0.6,
                        child: ListView.separated(
                          // Override the default padding value
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
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
                    ],
                  ),
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
            icon: FaIcon(FontAwesomeIcons.map),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.car),
            label: "Parked",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
