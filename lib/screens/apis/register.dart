import 'dart:convert';

import 'package:apptest/screens/apis/global_variables.dart';
import 'package:http/http.dart' as http;

getData() async {
  var response = await createUser();

  return response.statusCode;
}

Future<http.Response> createUser() {
  var headers = {'Content-Type': 'application/json'};
  var encode = json.encode({
    "name": newName,
    "last_name": newLastName,
    "email": newEmail,
    "country": 1,
    "documentation": newDocument,
    "documentation_type": 1,
    "password": newPass,
    "nickname": newName + ' ' + newLastName,
    "id_user_state": 1,
    "user_type": 1,
    "phone": newPhone
  });
  // print(encode);
  return http.post(
    Uri.parse("http://10.0.2.2:5000/api/v1/users/"),
    headers: headers,
    body: encode,
  );
}
