// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../apis/global_variables.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
            // child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 90,
              child: CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage('lib/assets/descarga.png'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(4),
                },

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TableRow(children: [
                    SizedBox(
                      height: 44,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Nombre:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(loggedUserName, style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: 44,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Apellido:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(loggedUserLastName,
                              style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: 44,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Correo:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(loggedUserEmail,
                              style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: 44,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Telefono:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(loggedUserPhone.toString(),
                              style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
                ],
              ),
            )
          ],
        )),
        // )
      ),
    );
  }
}
