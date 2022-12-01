import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'global_variables.dart';

getTemplate() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  // To decode the token
  Map<String, dynamic> tokenData = Jwt.parseJwt(token!);
  // print(tokenData['data'][0]['id']);
  var response = await newMethod(tokenData, token);
  print(response.statusCode);
  if (response.statusCode != 200) {
    print(response.statusCode);
    return Text("not template");
  } else {
    Invoices = response.body;
    await prefs.setString('invoices', response.body);
    return response.body;
  }

  // Print the payload
}

Future<http.Response> newMethod(tokenData, token) {
  print(InvoiceCompData);

  var userID = tokenData['data'][0]['id'].toString();
  var encode = jsonEncode(
      {"companyid": InvoiceCompData, "userid": userID, "token": token});
  var headers = {'Content-Type': 'application/json'};
  return http.post(
    Uri.parse("http://10.0.2.2:5005/api/v1/invoicer/getTemplate"),
    headers: headers,
    body: encode,
  );
}
