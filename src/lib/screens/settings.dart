import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme.dart';
import '../size_config.dart';
import '../services/places_autocompleter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/panel_widget.dart';
import '../widgets/draggable_indicator.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController searchController = TextEditingController();
  final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  final FocusNode _testNode = FocusNode();
  final PanelController _pController = PanelController();
  List<String> predictions = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
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
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      _pController.isPanelOpen
                          ? _pController.close()
                          : _pController.open();
                    });
                  },
                  child: Text("Toggle Panel"))
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
                // LISTVIEW BUILDER HERE
                Container(
                    height: SizeConfig.screenHeight * 0.74,
                    child: PanelWidget(controller: controller)),
              ]),
            );
          },
        ),
      ),
    );
  }
}
