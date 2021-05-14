import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/parkingSpot.dart';
import '../widgets/search_bar.dart';
import '../widgets/garage_preview.dart';
import '../widgets/garage_pictures.dart';

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
              target: LatLng(22, 88),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              height: devHeight * 0.5,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: devHeight * 0.05,
                    width: devWidth * 0.75,
                    child: SearchBar(
                      searchNode: _searchNode,
                      searchController: _searchController,
                    ),
                  ),
                  GaragePreview(
                      miles: miles,
                      availSpots: availSpots,
                      lowPrice: lowPrice,
                      highPrice: highPrice),
                  GaragePictures(
                    garage: result[0],
                  ),
                ],
              ),
            ),
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
