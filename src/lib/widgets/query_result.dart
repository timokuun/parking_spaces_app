import 'package:car_park_login/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import '../theme.dart';
import '../services/places_autocompleter.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

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
        if (userInput.isEmpty) {
          return Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Text(
              "Search to your heart's desire <3",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 12.sp,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Container(
              height: 15.h,
              width: 15.h,
              child: CircularProgressIndicator(
                strokeWidth: 4.sp,
                color: customCyan,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data.length > 0) {
          return Container(
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10.h),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    snapshot.data[index]["icon"],
                    color: customCyan,
                    height: 4.h,
                  ),
                  title: Text(
                    snapshot.data[index]["name"],
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
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
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Text(
              "No Results Found  :/",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 12.sp,
              ),
            ),
          );
        }
      },
    );
  }
}
