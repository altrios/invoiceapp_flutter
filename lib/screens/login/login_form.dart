// ignore_for_file: unnecessary_new

import 'package:apptest/screens/apis/login.dart';
import 'package:apptest/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../apis/global_variables.dart';

class login_form extends StatefulWidget {
  const login_form({Key? key}) : super(key: key);

  @override
  State<login_form> createState() => _login_formState();
}

class _login_formState extends State<login_form> {
  @override
  void initState() {
    super.initState();
    print("login");
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? Emailvalue;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (value) {
                    Emailvalue = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                  ),
                  validator: (String? Emailvalue) {
                    if (Emailvalue == null || Emailvalue.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (value) {
                    Emailvalue = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.key_off_outlined),
                    hintText: 'Password',
                  ),
                  validator: (String? Passlvalue) {
                    if (Passlvalue == null || Passlvalue.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  postData(emailController.text, passController.text)
                      .then((id) => {if (id == 200) _shoLogin(context)});
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
          ),
        ],
      ),
    );
  }

  void _shoLogin(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      print(Invoices);
      return const Home();
    });
    Navigator.of(context).push(route);
  }
}

class prueba extends StatefulWidget {
  const prueba({Key? key}) : super(key: key);

  @override
  State<prueba> createState() => _pruebaState();
}

class _pruebaState extends State<prueba> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("hola"));
  }
}

// if (_formKey.currentState!.validate()) {
//                   // Process data.
//                 }