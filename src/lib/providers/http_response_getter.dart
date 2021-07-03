import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getResponse() async {
  final Uri url = Uri.parse("http://10.0.2.2:3000/");
  var response = await http.get(url);

  // List of spots from our server
  var jsonData = json.decode(response.body)["data"];
  return jsonData;
}
