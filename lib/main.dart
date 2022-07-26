// ignore_for_file: prefer_const_constructors

import 'package:apptest/screens/home_page.dart';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class Palette {
  static const Color primary = Color.fromRGBO(35, 189, 97, 1);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        // Define el Brightness y Colores por defecto
        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent,

        // Define la Familia de fuente por defecto
        fontFamily: 'Montserrat',

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            minimumSize: const Size.fromHeight(40),
            primary: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),

        dividerTheme: DividerThemeData(
          thickness: 2,
          color: Colors.grey[200],
          space: 50,
        ),

        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.all(20),
          height: 40,
          buttonColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        // Define el TextTheme por defecto. Usa esto para espicificar el estilo de texto por defecto
        // para cabeceras, títulos, cuerpos de texto, y más.
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
      ),
    );
  }
}
