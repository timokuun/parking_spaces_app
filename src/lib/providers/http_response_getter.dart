import 'package:http/http.dart' as http;
import 'dart:convert';

// Function to pass back local spots from DB
// TODO: pass in long/lat from user to DB for query
Future<dynamic> httpGetAllSpots() async {
  final Uri url = Uri.parse("http://10.0.2.2:3000/");
  var response = await http.get(url);

  // List of spots from our server
  var jsonData = json.decode(response.body)["data"];
  return jsonData;
}

// Function to obtain specific spot using its ID from our DB
Future<dynamic> httpGetSpotFromId(String id) async {
  final Uri url = Uri.parse("http://10.0.2.2:3000/$id");
  var response = await http.get(url, headers: {
    "id": id,
  });
  return response;
}
