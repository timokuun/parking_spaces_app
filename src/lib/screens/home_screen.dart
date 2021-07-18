import 'dart:collection';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as math;

import 'package:car_park_login/widgets/spot_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'dart:async';

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
  GoogleMapController _mapController;
  FocusNode _searchNode = FocusNode();
  bool isSearching = false;
  String userInput = "";
  double fabHeight = 135;
  Location _location = Location();
  StreamSubscription<LocationData> locSubscription;
  bool firstTimeToUserLoc = true;

  // Used to obtain location permissions
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted;
  LocationData _userLocData;

  // TODO: To be deteled
  LatLng corner1 = LatLng(0, 0);
  LatLng corner2 = LatLng(0, 0);
  Set<Marker> testMarkerSet = new HashSet();

  // TODO: ---------FOR onCamerMove functionalities---------
  double currentZoom = 12;

  // TODO: Start slide-up panel in the closed position
  bool firstVisit = true;

  // TODO: Need to set to user location
  LatLng userSearchLatLng = LatLng(32.8800649, -117.2362022);

  void cancelSubscription() {
    locSubscription.cancel();
  }

  // TODO: Obtain user location for initial displayed results.
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    locSubscription = _location.onLocationChanged.listen(
      (loc) {
        print("serviceEnabled: $_serviceEnabled");
        print("_permissionGranted: $_permissionGranted");
        print("_userLocData: $_userLocData");
        if (firstTimeToUserLoc) {
          // if (firstTimeToUserLoc && _serviceEnabled) {
          //if (_permissionGranted == PermissionStatus.granted) {
          _mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(loc.latitude, loc.longitude),
              ),
            ),
          );
          _location.onLocationChanged.listen((loc) {
            setState(() {
              _userLocData = LocationData.fromMap(
                  {"latitude": loc.latitude, "longitude": loc.longitude});
            });
          });
          //}
          firstTimeToUserLoc = false;
        } else {
          // } else if (!firstTimeToUserLoc && _serviceEnabled) {
          cancelSubscription();
        }
      },
    );
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
        zoom: currentZoom,
      );
      // TODO: update new camera pos var
      _mapController
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPos));
    });
  }

  /* --------------------------------------------------TESTING-------------------------------------------------- */

  /****** NOT ACCURATE ******/
  LatLng calcMidPoint(double lat1, double lon1, double lat2, double lon2) {
    double dLon = math.radians(lon2 - lon1);

    lat1 = math.radians(lat1);
    lat2 = math.radians(lat2);
    lon1 = math.radians(lon1);

    double bx = cos(lat2) * cos(dLon);
    double by = cos(lat2) * sin(dLon);
    double lat3 = atan2(sin(lat1) + sin(lat2),
        sqrt((cos(lat1) + bx) * (cos(lat1) + bx) + by * by));
    double lon3 = lon1 + atan2(by, cos(lat1) + bx);

    double lat3_degree = math.degrees(lat3);
    double lon3_degree = math.degrees(lon3);

    return LatLng(lat3_degree, lon3_degree);
  }

  /****** NOTE: This was using our own "calcMidPoint" to calculate midpoint on the map, however it's not really accurate ******/
  /* Decided to use Google Map's "onCameraMove" where it provides the LatLng for the center of the map */
  // void onCameraIdleSearch() async {
  //   final visibleRegion = await _mapController.getVisibleRegion();
  //   print(
  //       "------------------------------visible region------------------------------");
  //   print(visibleRegion);
  //   corner1 = visibleRegion.northeast;
  //   corner2 = visibleRegion.southwest;

  //   LatLng midPoint = calcMidPoint(corner1.latitude, corner1.longitude,
  //       corner2.latitude, corner2.longitude);

  //   print(midPoint);

  //   onSearchSelected(midPoint);

  //   double newZoomLevel = await _mapController.getZoomLevel();

  //   print(
  //       "---------------------------------newZoomLevel---------------------------------");
  //   print(newZoomLevel);

  //   setState(() {
  //     corner1 = visibleRegion.northeast;
  //     corner2 = visibleRegion.southwest;
  //     testMarkerSet = HashSet<Marker>();
  //     testMarkerSet.add(
  //       Marker(
  //         markerId: MarkerId("1"),
  //         position: LatLng(corner1.latitude, corner1.longitude),
  //         infoWindow: InfoWindow(
  //           title: "Corner 1",
  //         ),
  //       ),
  //     );
  //     testMarkerSet.add(
  //       Marker(
  //         markerId: MarkerId("2"),
  //         position: LatLng(corner2.latitude, corner2.longitude),
  //         infoWindow: InfoWindow(
  //           title: "Corner 2",
  //         ),
  //       ),
  //     );
  //     testMarkerSet.add(
  //       Marker(
  //         markerId: MarkerId("3"),
  //         position: LatLng(midPoint.latitude, midPoint.longitude),
  //         infoWindow: InfoWindow(
  //           title: "midPoint",
  //         ),
  //       ),
  //     );
  //     currentZoom = newZoomLevel;
  //   });
  // }

  /* --------------------------Decided to use this one-------------------------- */
  void onCameraMoveSearch(CameraPosition cameraPos) async {
    print(
        "------------------------Apparently it is moving :)------------------------");

    print(
        "----------------------------cameraPos.target----------------------------");
    print(cameraPos.target);
    LatLng midPoint = cameraPos.target;
    double newZoomLevel = await _mapController.getZoomLevel();

    onSearchSelected(midPoint);

    setState(() {
      currentZoom = newZoomLevel;
      testMarkerSet = HashSet<Marker>();
      testMarkerSet.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(midPoint.latitude, midPoint.longitude),
          infoWindow: InfoWindow(
            title: "CameraPos",
          ),
        ),
      );
    });
  }

  /* --------------------------------------------------END TESTING-------------------------------------------------- */

  void initLocation() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Checking if prev permission exists
    var locPermission = await _location.hasPermission();

    // If not, we shall ask for location permission
    if (locPermission == PermissionStatus.denied) {
      locPermission = await _location.requestPermission();
      setState(() {
        _permissionGranted = locPermission;
        print("locPermission: $_permissionGranted");
      });

      // User rejects location permissions
      if (locPermission != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // check user location permission
    // context.read(userLocationProvider.notifier).initLocation();

    // TODO: conditionalize results (if there are no spots in an area)
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Consumer(
              builder: (context, watch, child) {
                final markerSet = watch(mapMarkerSetProvider);
                final results = watch(parkingSpotResultsProvider);
                final userLocation = watch(userLocationProvider.notifier);

                return SlidingUpPanel(
                  parallaxEnabled: true,
                  parallaxOffset: 0.075,
                  controller: _pController,
                  color: customBlack,
                  minHeight: SizeConfig.screenHeight * 0.15, // 0.27
                  // minHeight: SizeConfig.screenHeight * 0.01,
                  maxHeight: SizeConfig.screenHeight * 0.7,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  body: Stack(
                    children: [
                      _permissionGranted == PermissionStatus.granted
                          ? GoogleMap(
                              zoomControlsEnabled: false,
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                // TODO: this LatLng should be _userLocData
                                target: LatLng(32.8800649, -117.2362022),
                                zoom: currentZoom,
                              ),
                              onMapCreated: _onMapCreated,
                              onCameraMove: onCameraMoveSearch,
                              // onCameraMoveStarted: onCameraIdleSearch,
                              // markers: markerSet,
                              markers: testMarkerSet,

                              // With Location package, shows user location on the map
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                            )
                          // Pseudo-map without user location
                          : GoogleMap(
                              zoomControlsEnabled: false,
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(32.8800649, -117.2362022),
                                zoom: currentZoom,
                              ),
                              onMapCreated: _onMapCreated,
                              onCameraMove: onCameraMoveSearch,
                              // onCameraMoveStarted: onCameraIdleSearch,
                              // markers: markerSet,
                              markers: testMarkerSet,
                            )
                    ],
                  ),
                  onPanelSlide: (position) {
                    setState(() {
                      final panelHeightDifference =
                          (SizeConfig.screenHeight * 0.7) -
                              (SizeConfig.screenHeight * 0.15);
                      fabHeight = position * panelHeightDifference + 135;
                    });
                  },
                  panelBuilder: (controller) {
                    return Container(
                      height: 150,
                      child: Column(children: [
                        Container(
                          child: DraggableIndicator(),
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          height: SizeConfig.screenHeight * 0.64,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: controller,
                            itemBuilder: (context, index) {
                              return SpotResult(
                                spot: results[index],
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
            if (_userLocData != null)
              Positioned(
                right: 20,
                bottom: fabHeight,
                child: FloatingActionButton(
                  child: Icon(Icons.my_location),
                  foregroundColor: Colors.white,
                  backgroundColor: customCyan,
                  onPressed: () {
                    _mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                              _userLocData.latitude, _userLocData.longitude),
                          zoom: currentZoom,
                        ),
                      ),
                    );
                  },
                ),
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
