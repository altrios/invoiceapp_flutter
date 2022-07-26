import 'dart:convert';

import 'package:apptest/screens/apis/getinvoices.dart';
import 'package:apptest/screens/apis/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// String emailController;

postData(emailController, String passController) async {
  var response = await newMethod(emailController, passController);
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('token');
  // await prefs.remove('data');
  print(response.statusCode);
  if (response.statusCode == 200) {
    getInvoices().then((response) async => {
          if (response != 'not invoices')
            {
              await prefs.setStringList(
                  'Invoices', jsonDecode(response)['invoice']),
              Invoices = jsonDecode(response)['invoice'],
              print(Invoices),
              // print(invoiceList.length)
              // setState(invoiceList)
              // print(jsonDecode(response)['invoice'])
            }
        });
    Map<String, dynamic> userMap = jsonDecode(response.body);
// var user = User.fromJson(userMap);
    var jsonData = response.body;
    print(userMap['data'][0]['email']);
    await prefs.setString('token', userMap['token']);
    await prefs.setString('userNamedata', userMap['data'][0]['name']);
    await prefs.setString('userLastNamedata', userMap['data'][0]['last_name']);
    await prefs.setInt('userPhonedata', userMap['data'][0]['phone']);
    await prefs.setInt('userStatedata', userMap['data'][0]['id_user_state']);
    await prefs.setInt('userTypedata', userMap['data'][0]['user_type']);
    await prefs.setString('userEmaildata', userMap['data'][0]['email']);
  }

  return response.statusCode;
}

Future<http.Response> newMethod(String emailController, String passController) {
  var encode = json.encode({
    "email": emailController.trim().toLowerCase(),
    "password": passController.trim()
  });
  var headers = {'Content-Type': 'application/json'};
  // print(encode);
  return http.post(
    Uri.parse("http://10.0.2.2:5000/api/v1/users/login/"),
    headers: headers,
    body: encode,
  );
}
