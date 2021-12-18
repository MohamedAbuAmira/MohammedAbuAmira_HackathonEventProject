import 'dart:convert';
import 'dart:io';

import 'package:elancer_hackathon/core/helpers/helpers.dart';
import 'package:elancer_hackathon/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/prefs/shared_pref_controller.dart';
import 'end_points.dart';

class UserWebService with Helpers {
  final Map authBaseResponse = {};

  Future<Map> login(BuildContext context,
      {required Map<String, String> loginDetails}) async {
    var url = Uri.parse(ApiEndPoints.loginUrl);

    var response = await http.post(
      url,
      body: loginDetails,
      headers: {
        'lang': SharedPrefController().language,
      },
    );
    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
        jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body)['data'];
      final User user = User.fromJson(jsonObject);
      SharedPrefController().save(user: user);

      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
      );
      return authBaseResponse;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    } else {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    }
  }

  Future<Map> logout(
      BuildContext context,
      ) async {
    var url = Uri.parse(ApiEndPoints.logoutUrl);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        'lang': SharedPrefController().language,
        'X-Requested-With': 'XMLHttpRequest',
      },
    );
    authBaseResponse['status'] = jsonDecode(response.body)['status'] as bool;
    authBaseResponse['message'] =
    jsonDecode(response.body)['message'] as String;

    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
      );
      return authBaseResponse;
    } else {
      showSnackBar(
        context: context,
        message: authBaseResponse['message']!,
        error: true,
      );
      return authBaseResponse;
    }
  }

}
