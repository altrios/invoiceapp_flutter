// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:apptest/screens/login/login_form.dart';
import 'package:apptest/screens/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _shoLogin(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return Register();
    });
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //text area
                    Icon(
                      Icons.phone_android,
                      size: 100,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Prueba Login',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 20),
                    ),

                    //input area
                    login_form(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿No tienes usuario?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _shoLogin(context);
                          },
                          child: const Text('Registrate'),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
          ),
        ));
  }
}
