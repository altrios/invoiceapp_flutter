// import 'dart:convert';

// import 'package:apptest/screens/apis/register.dart';
// import 'package:flutter/material.dart';

// class RegisterForm extends StatefulWidget {
//   RegisterForm({Key? key}) : super(key: key);

//   @override
//   State<RegisterForm> createState() => _RegisterFormState();
// }

// class _RegisterFormState extends State<RegisterForm> {
//   bool isLoading = true;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   final nameController = TextEditingController();
//   final lastnameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final countryController = TextEditingController();
//   final usertypeController = TextEditingController();
//   // String dropdownValue = 'Australia';
//   String dropdownValue = 'Colombia';
//   String newListValue = '';
//   dynamic countryjson;
//   var countries;

//   @override
//   initState() {
//     super.initState();
//     // print(countryData());
//     // print('var countries');
//     // print(countries);
//     countryData();

//     print(countries);
//   }

//   countryData() async {
//     var countries = await getData();

//     Map<String, dynamic> countryjson = jsonDecode(countries);
//     print(countryjson);
//     setState(() {
//       // newListValue = countryjson['data'];
//       countryjson = countryjson;
//       bool isLoading = false;
//       // print(countryjson);
//     });
//     return 'countryjson';
//     // return 'ok';
//   }

//   @override
//   Widget build(BuildContext context) {
//     String? Namelvalue;
//     String? LastNamelvalue;
//     String? Emailvalue;
//     String? Passvalue;
//     String? Countrylvalue;
//     String? Phonevalue;
//     String? Documentvalue;
//     String? DocumentTypevalue;

//     print('newListValue');
//     print(isLoading);
//     return Form(
//       key: _formKey,
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     onSaved: (value) {
//                       Emailvalue = value;
//                     },
//                     keyboardType: TextInputType.name,
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.person_outline),
//                       hintText: 'Name',
//                     ),
//                     validator: (String? Namelvalue) {
//                       if (Namelvalue == null || Namelvalue.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             // prueba(),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     onSaved: (value) {
//                       Emailvalue = value;
//                     },
//                     keyboardType: TextInputType.name,
//                     controller: lastnameController,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.person_outline),
//                       hintText: 'LastName',
//                     ),
//                     validator: (String? LastNamelvalue) {
//                       if (LastNamelvalue == null || LastNamelvalue.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     onSaved: (value) {
//                       Emailvalue = value;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.email_outlined),
//                       hintText: 'Email',
//                     ),
//                     validator: (String? Emailvalue) {
//                       if (Emailvalue == null || Emailvalue.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     onSaved: (value) {
//                       Passvalue = value;
//                     },
//                     keyboardType: TextInputType.text,
//                     controller: passController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.key_off_outlined),
//                       hintText: 'Password',
//                     ),
//                     validator: (String? Passvalue) {
//                       if (Passvalue == null || Passvalue.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: DropdownButton<String>(
//                     // Step 3.
//                     value: dropdownValue,
//                     // Step 4.
//                     items: countryjson?.map((String items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items),
//                       );
//                     }).toList(),
//                     // items:countryjson.map(Closure: (e) => DropdownMenuItem<String>)
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownValue = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//     );
//   }
// }



// // class Prueba extends StatelessWidget {
// //   const Prueba({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[300],
// //       body: const Center(child: Text('data')),
// //     );
// //   }
// // }
