import 'package:departure_code/Controllers/CarousalSlider_Provider.dart';
import 'package:departure_code/Controllers/JsonData_Provider.dart';
import 'package:departure_code/View/Screens/DetailsPage.dart';
import 'package:departure_code/View/Screens/DohePage.dart';
import 'package:departure_code/View/Screens/HomePage.dart';
import 'package:departure_code/View/Screens/SpalchScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> JsonData_Provider()),
        ChangeNotifierProvider(create: (context)=> CarousalSlider_Provider()),
      ],
    builder: (context,_) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context)=> SplachScreen(),
        "HomePage" : (context)=> HomePage(),
        "DohePage" : (context)=> DohePage(),
        "DetailsPage" : (context)=> DetailsPage(),
      },
    ),
    ),
  );
}