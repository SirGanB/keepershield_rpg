import 'package:flutter/material.dart';

class BlueTheme {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.indigo[900],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.amber),
      ),
      colorScheme: ColorScheme(
        primary: Colors.lightBlueAccent[100]!,
        secondary: Colors.indigo[900]!,
        surface: Colors.indigoAccent,
        background: Colors.blue[900]!,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.grey,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        outline: Colors.amber,
        brightness: Brightness.dark,
      ),
    );
  }
}
