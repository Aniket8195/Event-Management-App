import 'package:eventapp/Widgets/Widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class EventReg {
  static const hostConnect = "http://192.168.1.119/project";
  static const registerEventEndpoint = "/event_registration.php";

  static void register(BuildContext context, int userID, int eventID) async {

    String userIDString = userID.toString();
    String eventIDString = eventID.toString();

    final response = await http.post(
      Uri.parse('$hostConnect$registerEventEndpoint'),
      body: {
        'UserID': userIDString,
        'EventID': eventIDString,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      showSnackBar("Registered", context, Icons.done, Colors.green);
    } else {
      throw Exception('Failed to register for the event');
    }
  }
}