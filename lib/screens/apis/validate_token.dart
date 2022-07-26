import 'dart:convert';

import 'package:apptest/screens/apis/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> validate_token(String? string) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  // loggedUserName = prefs.getString('userNamedata');

  var response = await newMethod(token);

  if (response.statusCode != 200 || token == null) {
    await prefs.remove('token');
    await prefs.remove('userNamedata');
    await prefs.remove('userLastNamedata');
    await prefs.remove('userPhonedata');
    await prefs.remove('userStatedata');
    await prefs.remove('userTypedata');
    await prefs.remove('userEmaildata');
    loggedUserName = '';
    loggedUserLastName = '';
    loggedUserEmail = '';
    loggedUserPhone = 0;

    return "No";
  } else {
    loggedUserName = prefs.getString('userNamedata')!;
    loggedUserLastName = prefs.getString('userLastNamedata')!;
    loggedUserEmail = prefs.getString('userEmaildata')!;
    loggedUserPhone = prefs.getInt('userPhonedata')!;

    return "okkk";
  }
}

Future<http.Response> newMethod(token) {
  var encode = json.encode({"token": token});
  var headers = {'Content-Type': 'application/json'};

  return http.post(
    Uri.parse("http://10.0.2.2:4999/verify"),
    headers: headers,
    body: encode,
  );
}
