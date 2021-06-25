import 'package:car_park_login/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import '../theme.dart';
import '../services/places_autocompleter.dart';

class QueryResult extends StatelessWidget {
  final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  final String userInput;
  final LatLng userSearchLatLng;
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
        print("----------snapshot");
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            color: Colors.black,
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.screenHeight * 0.15,
              width: SizeConfig.screenHeight * 0.15,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: customCyan,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data.length > 0) {
          return Container(
            color: Colors.black,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 75),
            height: SizeConfig.screenHeight,
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(snapshot.data[index]["name"]),
                  subtitle: Text(snapshot.data[index]["formatted_address"]),
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
        } else {
          return Container(
            color: Colors.black,
            alignment: Alignment.center,
            height: SizeConfig.screenHeight,
            child: Text(
              "No Results Found.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
