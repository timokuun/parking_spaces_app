import 'dart:async';
import 'package:car_park_login/widgets/ourWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
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
          Stack(
            children: [
              // Scrollable Search result list
              // TODO: Make the "result" widget so they can be children of this widget
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.red,
                  height: devHeight * 0.5,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: devWidth * 0.85,
                  height: devHeight * 0.06,
                  margin: EdgeInsets.fromLTRB(0, devHeight * 0.07, 0, 0),
                  child: TextField(
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () => _searchNode.requestFocus(),
                    focusNode: _searchNode,
                    obscureText: false,
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 40, 10),
                      // contentPadding: EdgeInsets.all(10),
                      hintText: "Where are you going?",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: SizedBox.expand(
          //     child: DraggableScrollableSheet(
          //       initialChildSize: devHeight * 0.3,
          //       maxChildSize: devHeight * 0.1,
          //       builder: (BuildContext ctx, s) {
          //         return Container(
          //           padding: EdgeInsets.symmetric(
          //             horizontal: 15,
          //             vertical: 10,
          //           ),
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(20),
          //               topRight: Radius.circular(20),
          //             ),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey,
          //                 blurRadius: 10,
          //               )
          //             ],
          //           ),
          //           child: ListView(
          //             controller: s,
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
