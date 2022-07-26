import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'global_variables.dart';

getInvoices() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  // To decode the token
  Map<String, dynamic> tokenData = Jwt.parseJwt(token!);
  // print(tokenData['data'][0]['id']);
  var response = await newMethod(tokenData, token);
  // print(response.statusCode);
  if (response.statusCode != 200) {
    return Text("not invoices");
  } else {
    Invoices = response.body;
    await prefs.setString('invoices', response.body);
    return response.body;
  }

  // Print the payload
}

Future<http.Response> newMethod(tokenData, token) {
  var userID = tokenData['data'][0]['id'].toString();
  var encode = jsonEncode({"token": token});
  var headers = {'Content-Type': 'application/json'};
  print("http://10.0.2.2:5003/api/v1/invoice/user/" +
      userID +
      "/?limit=10&page=1");
  return http.post(
    Uri.parse("http://10.0.2.2:5003/api/v1/invoice/user/" +
        userID +
        "/?limit=10&page=1"),
    headers: headers,
    body: encode,
  );
}
