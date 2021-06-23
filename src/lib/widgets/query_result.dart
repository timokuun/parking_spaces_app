import 'package:car_park_login/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import '../services/places_autocompleter.dart';

class QueryResult extends StatelessWidget {
  final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  String userInput;
  LatLng userSearchLatLng;
  final Function onSearchSelected;

  QueryResult({
    @required this.userInput,
    @required this.onSearchSelected,
    @required this.userSearchLatLng,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: placesGetter.getPredictions(userInput),
      builder: (context, snapshot) {
        print("-----snapshot $snapshot");
        print(snapshot.data.length);
        return Container(
          color: Colors.black,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 75),
          height: SizeConfig.screenHeight,
          child: ListView.builder(
            // itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(snapshot.data[index]["formatted_address"]),
                onTap: () {
                  LatLng selected = LatLng(
                      snapshot.data[index]["geometry"]["location"]["lat"],
                      snapshot.data[index]["geometry"]["location"]["lng"]);
                  onSearchSelected(selected);
                },
              );
            },
          ),
        );
      },
    );
  }
}
