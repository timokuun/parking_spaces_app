import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import '../theme.dart';
import '../models/parking_garage.dart';
import '../widgets/search_bar.dart';
import '../widgets/garage_result.dart';
import '../widgets/draggable_indicator.dart';
import '../widgets/query_result.dart';
import 'dart:collection';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController singleChildSrollController = new ScrollController();
  TextEditingController _searchController = TextEditingController();
  // final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  FocusNode _searchNode = FocusNode();
  List<String> predictions = [];
  bool isSearching = false;
  String userInput = "";
  // TODO: Need to set to user location
  LatLng userSearchLatLng = LatLng(32.8800649, -117.2362022);
  // TODO: List of spots
  // List<dynamic> spotsResult = [];

  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      /* Places ID */
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(32.8800649, -117.2362022),
          infoWindow: InfoWindow(
            title: "Leggo",
            snippet: "Me Gay",
          ),
        ),
      );
    });
  }

  void onSearchSelected(LatLng newLatLng) async {
    // void onSearchSelected(LatLng newLatLng) {
    final Uri url = Uri.parse("http://10.0.2.2:3000/");
    var response = await http.get(url);
    var jsonData = json.decode(response.body)["data"];

    setState(() {
      userSearchLatLng = newLatLng;
      isSearching = false;
      // TODO: populate list of markers
      _markers.clear();
      for (var data in jsonData) {
        _markers.add(
          Marker(
            markerId: MarkerId("${data["id"]}"),
            position: LatLng(data["lat"], -data["lng"]),
            infoWindow: InfoWindow(
              title: data["name"],
              snippet: data["description"],
            ),
          ),
        );
      }

      final CameraPosition newCameraPos = CameraPosition(
        target: userSearchLatLng,
        zoom: 15,
      );
      _mapController
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPos));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double miles = 1.1;
    int lowPrice = 100;
    int highPrice = 200;

    // TODO: conditionalize results (if there are no spots in an area)
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                // target: LatLng(37.773972, -122.431297),
                target: LatLng(32.8800649, -117.2362022),
                zoom: 15,
              ),
              onMapCreated: _onMapCreated,
              markers: _markers,
            ),
            // TODO: finalize max height for DSS
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              // TODO: Need to reach last element of list but DSS gets too tall
              maxChildSize: 0.85,
              minChildSize: 0.1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: customBlack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  // Prevent List View from overflowing DSS
                  padding: EdgeInsets.only(
                    top: 7,
                  ),
                  child: SingleChildScrollView(
                    controller: singleChildSrollController,
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.75,
                          child: ListView.separated(
                            controller: scrollController,
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            separatorBuilder: (_, __) => Divider(
                              height: 7,
                            ),
                            itemBuilder: (context, index) {
                              // NOTE: First item is the Draggable indicator
                              return index == 0
                                  ? DraggableIndicator()
                                  : GarageResult(
                                      miles: miles,
                                      lowPrice: lowPrice,
                                      highPrice: highPrice,
                                      garage: result[index - 1],
                                    );
                            },
                            // NOTE: ITEMCOUNT has to be the length + 1 (including indicator)
                            itemCount: result.length + 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            isSearching
                ? QueryResult(
                    userInput: userInput,
                    onSearchSelected: onSearchSelected,
                    userSearchLatLng: userSearchLatLng,
                  )
                : SizedBox(),
            Align(
              alignment: Alignment.topCenter,
              child: SearchBar(
                searchNode: _searchNode,
                searchController: _searchController,
                height: SizeConfig.screenHeight * 0.055,
                width: SizeConfig.screenWidth * 0.88,
                margin: EdgeInsets.only(
                  top: 15,
                  bottom: 5,
                ),
                onTap: () {
                  isSearching = true;
                  _searchNode.requestFocus();
                },
                onChanged: (input) {
                  setState(() {
                    userInput = input;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
