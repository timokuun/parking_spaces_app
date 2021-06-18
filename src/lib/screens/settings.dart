import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';
import '../screens/login_screen.dart';
import '../widgets/general_button.dart';
import '../services/places_autocompleter.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController searchController = TextEditingController();
  final PlacesAutocompleter placesGetter = PlacesAutocompleter();
  final FocusNode _testNode = FocusNode();
  List<String> predictions = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: customBlack,
        body: Center(
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.27,
                width: SizeConfig.screenWidth,
                child: TextField(
                  focusNode: _testNode,
                  controller: searchController,
                  onChanged: (userInput) async {
                    List<String> obtained = [];
                    if (userInput.length > 0) {
                      obtained = await placesGetter.getPredictions(userInput);
                    }
                    setState(() {
                      predictions = obtained;
                    });
                  },
                  onTap: () {
                    _testNode.requestFocus();
                  },
                ),
              ),
              Container(
                color: Colors.green,
                width: SizeConfig.screenWidth * 0.85,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 150,
                      width: SizeConfig.screenWidth * 0.9,
                      child: ListView.builder(
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return Text(predictions[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              GeneralButton(
                buttonLabel: "Logout",
                height: SizeConfig.screenHeight * 0.05,
                width: SizeConfig.screenHeight * 0.1,
                margin: EdgeInsets.all(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
