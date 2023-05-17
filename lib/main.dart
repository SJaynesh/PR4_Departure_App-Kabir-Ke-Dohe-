import 'package:departure_code/View/Screens/SpalchScreen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context)=> SplachScreen(),
      },
    ),
  );
}