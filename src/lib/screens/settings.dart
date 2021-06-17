import 'package:car_park_login/screens/login_screen.dart';
import 'package:car_park_login/widgets/garage_pictures.dart';
import 'package:car_park_login/widgets/garage_result.dart';
import 'package:car_park_login/widgets/garage_title.dart';
import 'package:car_park_login/widgets/general_button.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';
import '../models/parking_spot.dart';
import '../services/places_autocompleter.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/test';
  final List<String> backgrounds;

  SettingsScreen({this.backgrounds});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> predictions = ["i", "i", "i", "i", "i"];
  Future<List<String>> predResults;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool userTyped = false;
    String result = " ";
    PlacesAutocompleter placesGetter = PlacesAutocompleter();
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: customBlack,
        body: Center(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: SizeConfig.screenHeight * 0.27,
                width: SizeConfig.screenWidth,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (userInput) async {
                    String results =
                        await placesGetter.obtainPredictions(userInput);
                    // if (userInput.length > 0) {
                    //   List<String> results =
                    //       await placesGetter.values(userInput);
                    //   print("hello");
                    //   print("-----results length:" + results.length.toString());
                    //   this.setState(() {
                    //     // Set height of result container to SizeConfig.screenHeight * 0.5;
                    //     userTyped = true;
                    //     predictions = results;

                    //     // Collect list of predictions from PlacesAutocompleter
                    //     // predictions = await placesGetter.values(userInput);
                    //   });
                    // }
                  },
                ),
              ),
              // Container to hold the user's prediction results
              //if (searchController.value.toString().length > 0)
              //makeResults(searchController.value.toString())

              Container(
                color: Colors.green,
                height: 100,
                width: SizeConfig.screenWidth * 0.85,
                child: Column(
                  children: [
                    Text(predictions[0]),
                    Text(predictions[2]),
                    Text(predictions[1]),
                    Text(predictions[4]),
                    Text(predictions[3]),
                  ],
                ),
              ),
            ],
          ),
        ),

        // TODO: Restore original log in button
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     GeneralButton(
        //       buttonLabel: "Logout",
        //       height: SizeConfig.screenHeight * 0.05,
        //       width: SizeConfig.screenHeight * 0.1,
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => LoginPage(),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// Tried to utilize FutureBuilder to make the container with predictions as
//  as it should handle futures (future in set state gave problems)

// Next, try to have setState in textField to UPDATE the future of this futureBuilder...
Widget makeResults(String userInput) {
  print(userInput);
  if (userInput.isEmpty) return Text("Wait for it...");
  PlacesAutocompleter placesGetter = PlacesAutocompleter();
  Future<List<String>> predResults;
  FutureBuilder(
    future: predResults,
    builder: (context, snapshot) {
      print(snapshot.data.length);
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text("None");
          break;
        case ConnectionState.active:
        case ConnectionState.waiting:
          return Text("Loading");
        case ConnectionState.done:
          return Column(children: [
            snapshot.data.asMap().forEach((index, element) {
              Text(snapshot.data[index]);
            })
          ]);
        default:
          return Text("Default");
      }
    },
  );
}
