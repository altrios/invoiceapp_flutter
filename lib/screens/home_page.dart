import 'dart:convert';

import 'package:apptest/login_page.dart';
import 'package:apptest/screens/apis/getinvoices.dart';
import 'package:apptest/screens/apis/validate_token.dart';
import 'package:apptest/screens/homeContent/companyArea/invoice_list.dart';

import 'package:apptest/screens/homeContent/usersArea/userSetting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'apis/global_variables.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  String get text => 'hola';

  @override
  State<Home> createState() => _HomeState();
}

void _shoLogin(BuildContext context) {
  final route = MaterialPageRoute(builder: (BuildContext context) {
    print("redirigir");
    return const LoginPage();
  });
  Navigator.of(context).push(route);
}

var caller = '1';

class _HomeState extends State<Home> {
  bool isLoading = true;
  String text = '2';
  @override
  initState() {
    super.initState();
    valueData();
    validated = validated;
    var prueba;
    // print(validated);
  }

  dynamic validated = 'si';
  contentHome(String menu) {
    setState(() {
      caller = menu;
    });
  }

  callContent(String call) {
    if (call == 2) {
      print("aqui");
      print(call);
      return const UserSetting();
    }
  }

  valueData() async {
    final prefs = await SharedPreferences.getInstance();
    print(Invoices);
    Invoices = prefs.getStringList('Invoices');
    validated = await validate_token(prefs.getString('token'));
    if (validated == 'No') {
      _shoLogin(context);
    }
    print(loggedUserName);
    setState(() {
      validated = validated;
      isLoading = false;
    });
    return 'ok';
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  // final String text = 'world!';
  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPage()
      : Scaffold(
          key: _globalKey,
          // appBar: AppBar(title: Text('title')),
          drawer: SafeArea(
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 64.0,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(238, 238, 238, 1),
                          border: Border(
                              bottom: BorderSide(
                            color: Color.fromRGBO(248, 248, 248, 1),
                            width: 0.5,
                          ))),
                      child: Text(loggedUserName),
                    ),
                  ),
                  ListTile(
                    title: const Text('Perfil'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      contentHome('1');
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Otra cosa'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      contentHome('2');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
//       // appBar: AppBar(title: Text('Home')),
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Stack(children: [
              IconButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
              Column(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CallingContent(),
                  ),
                ),
              ])
            ]),
          ));
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Center(
          child: SpinKitCubeGrid(
        color: Colors.deepPurpleAccent,
        size: 130,
      )),
    );
  }
}

class CallingContent extends StatefulWidget {
  const CallingContent({Key? key}) : super(key: key);

  @override
  State<CallingContent> createState() => _CallingContentState();
}

class _CallingContentState extends State<CallingContent> {
  @override
  Widget build(BuildContext context) {
    if (caller == '1') {
      return Container(
        child: const UserSetting(),
      );
    } else {
      var invoiceList = [];

      return Container(
        child: Invoice_list(),
      );
    }
  }
}
