import 'package:car_park_login/size_config.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../services/places_autocompleter.dart';

class QueryResult extends StatelessWidget {
  final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  String userInput;
  final Function onResultTap;

  QueryResult({this.userInput, this.onResultTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: placesGetter.getPredictions(userInput),
      builder: (context, snapshot) {
        print("-----snapshot $snapshot");
        return Container(
          color: Colors.black,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 75),
          height: SizeConfig.screenHeight,
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              // return InkWell(
              //   onTap: onResultTap,
              //   child: Text(
              //     snapshot.data[index]["formatted_address"],
              //     style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       fontSize:
              //     ),
              //   ),
              // );
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(snapshot.data[index]["formatted_address"]),
                onTap: onResultTap,
              );
            },
          ),
        );
      },
    );
  }
}
