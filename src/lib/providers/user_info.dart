import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Writes data to devices
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/parking_spot_v2.dart';

// Persistent data entry keys
const lightDarkMode = "lightDarkMode";
const accessTkn = "accessToken";
const refreshTkn = "userToken";

// Key for Parker/Spotter view
const appView = "appView";

// Strings to identify Parker / Spotter modes
const parkerMode = "parker";
const spotterMode = "spotter";

class UserInfo extends ChangeNotifier {
  // TODO: tokens should be stored using "flutter_secure_storage" package
  String accessToken;
  String refreshToken;
  bool darkMode;
  String userMode; // toggle between Parker/Spotter views
  List<ParkingSpotV2> ownedSpots;

  UserInfo() {
    this.accessToken = "";
    this.refreshToken = "";
    this.darkMode = true;
    this.ownedSpots = [];
  }

  // Check if there is entry set, if not then this is first app launch
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // If null (no entry) then user's first time launching app
    final currMode = prefs.containsKey(lightDarkMode);

    // No entry found, this is user's first app launch
    if (!currMode) {
      // Set notifier and persistent data for theme, user auth and user mode
      await prefs.setBool(lightDarkMode, true);
      darkMode = true;

      // TODO: Log user in to obtain tokens
      await prefs.setString(accessTkn, "");
      await prefs.setString(refreshTkn, "");
      accessToken = "";
      refreshToken = "";

      // Note: Default userMode is Parker
      await prefs.setString(appView, parkerMode);
      userMode = parkerMode;

      // Init user owned spots list to empty
      ownedSpots = [];
      notifyListeners();
    } else {
      // Extract data from user's device
      accessToken = prefs.getString(accessTkn);
      refreshToken = prefs.getString(refreshTkn);
      darkMode = prefs.getBool(lightDarkMode);
      userMode = prefs.getString(appView);
      notifyListeners();
    }
  }

  // TODO: Pass userID to obtain spotter's spots
  Future<void> getOwnedSpots() async {
    // Empty prev list
    ownedSpots = [];

    // Grab owned spots from db
    final Uri url = Uri.parse("http://10.0.2.2:3000/owned-spots");

    // TODO: Use local-server for development
    // final Uri url = Uri.parse("http://www.api.aniimo.co/demo-server");
    var response = await http.get(url);

    // List of spots from our server
    var jsonData = json.decode(response.body)["data"];

    if (jsonData.isEmpty) {
      notifyListeners();
      return;
    }

    // Convert to ParkingSpotV2 and add to list of owned spots
    for (var data in jsonData) {
      ownedSpots.add(ParkingSpotV2.fromJson(data));
    }
    notifyListeners();
  }

  // Sign in the user
  Future<void> userSignIn(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Attempt to login, if successful, return access and refresh tokens

    // Set the tokens securely in device
    // prefs.setString(accessTkn, token);
    // prefs.setString(refreshTkn, token);
    // accessToken = token;
    // refreshToken = token;
    notifyListeners();
  }

  // Logout the user
  Future<void> userLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(accessTkn, "");
    prefs.setString(refreshTkn, "");
    accessToken = "";
    refreshToken = "";
    notifyListeners();
  }

  // Toggle user modes
  Future<void> toggleUserMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currMode = prefs.getString(appView);
    String newMode = currMode == parkerMode ? spotterMode : parkerMode;
    prefs.setString(appView, newMode);
    userMode = newMode;
    notifyListeners();
  }

  // Toggle light/dark mode
  Future<void> toggleDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(lightDarkMode, value);
    darkMode = value;
    notifyListeners();
  }
}
