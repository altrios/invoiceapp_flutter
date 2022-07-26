import 'package:apptest/screens/register/register_form.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    children: const [
                      SizedBox(
                        height: 25,
                      ),
                      register_form()
                    ]),
              ),
            ),
          ),
        )));
  }
}
