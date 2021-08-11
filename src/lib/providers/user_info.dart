import 'package:flutter/material.dart';

// Allows us to write persistent data to user's device
import 'package:shared_preferences/shared_preferences.dart';

// Persistent data entry keys
const darkMode = "darkMode";
const userToken = "userToken";
// Key for Parker/Spotter view
const appView = "appView";

// Strings to identify Parker / Spotter modes
const parkerMode = "parker";
const spotterMode = "spotter";

class UserInfo extends ChangeNotifier {
  UserAuth auth = UserAuth();
  UserSettings settings = UserSettings();

  // Check if there is entry set, if not then this is first app launch
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // If null (no entry) then user's first time launching app
    final currMode = prefs.containsKey(darkMode);

    // No entry found, this is user's first app launch
    if (!currMode) {
      // Set notifier and persistent data for theme, user auth and user mode
      await prefs.setBool(darkMode, true);
      settings.darkMode = true;

      await prefs.setString(userToken, "");
      auth.sessionToken = "";

      // Note: Default userMode is Parker
      await prefs.setString(appView, parkerMode);
      settings.userMode = parkerMode;
      notifyListeners();
    } else {
      // Extract data from user's device
      auth.sessionToken = prefs.getString(userToken);
      settings.darkMode = prefs.getBool(darkMode);
      settings.userMode = prefs.getString(appView);
      notifyListeners();
    }
  }

  // Sign in the user
  void userSignIn(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userToken, token);
    auth.sessionToken = token;
    notifyListeners();
  }

  // Logout the user
  void userLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userToken, "");
    auth.sessionToken = "";
    notifyListeners();
  }

  // Toggle user modes
  void toggleUserMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currMode = prefs.getString(appView);
    String newMode = currMode == parkerMode ? spotterMode : parkerMode;
    prefs.setString(appView, newMode);
    settings.userMode = newMode;
    notifyListeners();
  }

  // Toggle light/dark mode
  void toggleDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkMode, value);
    settings.darkMode = value;
    notifyListeners();
  }
}

class UserAuth {
  String sessionToken;

  UserAuth([this.sessionToken = ""]);
}

class UserSettings {
  bool darkMode;

  // Added to toggle between Parker/Spotter views
  String userMode;

  UserSettings([this.darkMode = true, this.userMode = parkerMode]);
}
