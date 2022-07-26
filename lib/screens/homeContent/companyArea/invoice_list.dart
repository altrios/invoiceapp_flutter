// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../apis/global_variables.dart';
// import 'package:intl/intl_browser.dart';

class Invoice_list extends StatefulWidget {
  // Invoice_list({Key? key}) : super(key: key);

  @override
  State<Invoice_list> createState() => _Invoice_listState();
}

List items = ['hola', 'adios', "como estas?"];
getSession() async {
  final prefs = await SharedPreferences.getInstance();
  print("eso");
  print(prefs.getString('Invoice'));
}

var getInv;

@override
class _Invoice_listState extends State<Invoice_list> {
  @override
  void initState() {
    super.initState();
    // getSession();
    getIingnvoices();
    // print("hoila");
    // getInv = jsonDecode(getInv)['invoice'];
    // print(getInv);
  }

  bool isLoading = true;
  Widget build(BuildContext context) => isLoading
      ? Text('data')
      : Container(
          child: GridView.count(crossAxisCount: 1, children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            for (var item in getInv)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: Ink(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('lib/assets/descarga.png'),
                          ),
                          title: Text(item['business_name']),
                          subtitle:
                              Text(item['created_at'].replaceAll('.000Z', "")),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ]));
  getIingnvoices() async {
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
      setState(() {
        getInv = jsonDecode(response.body)['invoice'];
        isLoading = false;
      });

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
}
