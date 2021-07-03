import 'package:car_park_login/widgets/spot_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../size_config.dart';
import '../theme.dart';

import '../providers/providers.dart';
import '../widgets/search_bar.dart';
import '../widgets/spot_result.dart';
import '../widgets/draggable_indicator.dart';
import '../widgets/query_result.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController singleChildSrollController = new ScrollController();
  TextEditingController _searchController = TextEditingController();
  final PanelController _pController = PanelController();
  FocusNode _searchNode = FocusNode();
  bool isSearching = false;
  String userInput = "";

  // TODO: Start slide-up panel in the closed position
  bool firstVisit = true;

  // TODO: Need to set to user location
  LatLng userSearchLatLng = LatLng(32.8800649, -117.2362022);

  GoogleMapController _mapController;

  // TODO: Obtain user location for initial displayed results
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void onSearchSelected(LatLng newLatLng) async {
    setState(() {
      firstVisit = false;

      // Update markers and results in future provider
      context.read(httpResponseProvider);
      userSearchLatLng = newLatLng;
      isSearching = false;
      FocusScope.of(context).unfocus();

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

    // TODO: conditionalize results (if there are no spots in an area)
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Consumer(
              builder: (context, watch, child) {
                final markerSet = watch(mapMarkerSetProvider);
                final results = watch(parkingSpotResultsProvider);
                return SlidingUpPanel(
                  parallaxEnabled: true,
                  parallaxOffset: 0.075,
                  controller: _pController,
                  color: customBlack,
                  minHeight: SizeConfig.screenHeight * 0.27,
                  maxHeight: SizeConfig.screenHeight * 0.8,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  body: Stack(
                    children: [
                      GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(32.8800649, -117.2362022),
                          zoom: 15,
                        ),
                        onMapCreated: _onMapCreated,
                        markers: markerSet,
                      ),
                    ],
                  ),
                  panelBuilder: (controller) {
                    return Container(
                      height: 150,
                      child: Column(children: [
                        Container(
                          child: DraggableIndicator(),
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          height: SizeConfig.screenHeight * 0.74,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: controller,
                            itemBuilder: (context, index) {
                              return SpotResult(
                                name: results[index].name,
                                address: results[index].address,
                                price: results[index].price.toStringAsFixed(2),
                                imageUrl: results[index].imageUrl,
                              );
                            },
                            itemCount: results.length,
                          ),
                        ),
                      ]),
                    );
                  },
                );
              },
            ),
            if (isSearching)
              Stack(
                children: [
                  // TODO: put icon button inside of QueryResult
                  QueryResult(
                    userInput: userInput,
                    onSearchSelected: onSearchSelected,
                    userSearchLatLng: userSearchLatLng,
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight * 0.012,
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                          FocusScope.of(context).unfocus();
                        });
                      },
                    ),
                  ),
                ],
              ),
            Align(
              alignment: Alignment.topCenter,
              child: SearchBar(
                searchNode: _searchNode,
                searchController: _searchController,
                height: SizeConfig.screenHeight * 0.055,
                width: SizeConfig.screenWidth * 0.75,
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
