// ignore_for_file: unnecessary_new


import 'dart:core';

import 'package:apptest/login_page.dart';
import 'package:flutter/material.dart';

import '../apis/global_variables.dart';

import 'package:animate_do/animate_do.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../apis/register.dart';

class register_form extends StatefulWidget {
  const register_form({Key? key}) : super(key: key);

  @override
  State<register_form> createState() => _register_formState();
}

var isLoading = 'ssss';
String dropdownValue = 'Spain';
var countries;
var countryjson;

class _register_formState extends State<register_form> {
  List<String> countries = [];
  @override
  String newListValue = '';
  dynamic countryjson;

  @override
  initState() {
    super.initState();

    // print('var countries');
    // print(countryjson);
  }

  countryData() async {
    // var countries = await getData();

    // globalCountries = jsonDecode(countries);
    // print(countryjson);
    setState(() {
      // newListValue = countryjson['data'];
      countryjson = countryjson;
      isLoading = 'falsesss';
      // print(countryjson);
    });
    return 'countryjson';
    // return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    var Countries;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    final lastnameController = TextEditingController();
    final phoneController = TextEditingController();
    final countryController = TextEditingController();
    final usertypeController = TextEditingController();
    final documentController = TextEditingController();

    List<String> Countrylist = [];

    for (Countries in globalCountries) {
      // print(Countries);
      Countrylist.add(Countries['Pais']);
    }
    String? Namevalue;
    String? LastNamevalue;
    String? Emailvalue;
    String? Passvalue;
    String? Countryvalue;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          // prueba(),
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
                    Namevalue = value;
                  },
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Nombre',
                  ),
                  validator: (String? Namevalue) {
                    if (Namevalue == null || Namevalue.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      newName = Namevalue;
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
                    LastNamevalue = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: lastnameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Apellido',
                  ),
                  validator: (String? LastNamevalue) {
                    if (LastNamevalue == null || LastNamevalue.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      newLastName = LastNamevalue;
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
                    Namevalue = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: documentController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.fingerprint_outlined),
                    hintText: 'documento',
                  ),
                  validator: (String? Documentvalue) {
                    if (Documentvalue == null || Documentvalue.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      newDocument = Documentvalue;
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
                    } else {
                      newEmail = Emailvalue;
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
                    Passvalue = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.key_off_outlined),
                    hintText: 'Password',
                  ),
                  validator: (String? Passvalue) {
                    if (Passvalue == null || Passvalue.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      newPass = Passvalue;
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    // Step 3.
                    buttonDecoration: const BoxDecoration(
                        color: Color.fromARGB(255, 241, 240, 240),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0),
                          )
                        ],
                        border: Border(
                          top: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    value: dropdownValue,
                    underline: Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                    isExpanded: true,

                    // Step 4.
                    items: Countrylist.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: FadeIn(
                            child: Text(items, style: const TextStyle(fontSize: 18))),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        newCountry = newValue;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: const Color.fromARGB(255, 19, 19, 18),

                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),

                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 400,
                    // dropdownFullScreen: true,
                    dropdownWidth: 300,
                    dropdownPadding: const EdgeInsets.all(20),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[200],
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    // offset: const Offset(-20, 0),
                  ),
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
                    LastNamevalue = value;
                  },
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Numero de telefono',
                  ),
                  validator: (String? Phonevalue) {
                    if (Phonevalue == null || Phonevalue.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      newPhone = Phonevalue;
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
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  // getData(algo);
                  getData().then((id) => {
                        if (id == 201)
                          {
                            print("usuario creado"),
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Usuario Registrado')),
                            ),
                            _shoLogin(context)
                          }
                      });
                }
              },
              child: const Text('Crear Usuario'),
            ),
          ),
        ],
      ),
    );
  }

  void _shoLogin(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return const LoginPage();
    });
    Navigator.of(context).push(route);
  }
}
