import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class EventDetialsWebService {
  final String eventId;
  EventDetialsWebService({
    required this.eventId,
  });
  Future<dynamic> getEventDetials() async {
    var url = Uri.parse(ApiEndPoints.eventDetialsUrl + '/$eventId');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      return jsonDecode(response.body)['object'];
    } else {
      throw Exception('Failed to load event');
    }
  }
}
