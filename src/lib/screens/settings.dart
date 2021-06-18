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
    List<String> results = [];
    String result = "first";
    PlacesAutocompleter placesGetter = PlacesAutocompleter();
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: customBlack,
        body: Center(
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.27,
                width: SizeConfig.screenWidth,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (userInput) async {
                    // List<String> obtained =
                    //     await placesGetter.getPredictions(userInput);
                    String temp = await placesGetter.getPredictions(userInput);

                    setState(() {
                      result = temp;
                    });
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
                    Text("$result"),
                  ],
                ),
              ),
            ],
          ),
        ),

        // TODO: Restore original logout button
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
