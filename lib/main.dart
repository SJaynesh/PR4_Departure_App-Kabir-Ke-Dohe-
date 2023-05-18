import 'package:departure_code/Controllers/CarousalSlider_Provider.dart';
import 'package:departure_code/Controllers/JsonData_Provider.dart';
import 'package:departure_code/Controllers/Lang_Provider.dart';
import 'package:departure_code/View/Screens/DetailsPage.dart';
import 'package:departure_code/View/Screens/DohePage.dart';
import 'package:departure_code/View/Screens/HomePage.dart';
import 'package:departure_code/View/Screens/SpalchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controllers/Theme_Provider.dart';
import 'Globals/Global.dart';
import 'Models/Theme_Model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isDark = Pref.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> JsonData_Provider()),
        ChangeNotifierProvider(create: (context)=> CarousalSlider_Provider()),
        ChangeNotifierProvider(
            create: (context) =>
                Theme_Provider(m1: Theme_Model(isDark: isDark))),
        ChangeNotifierProvider(create: (context)=> Lang_Provider()),
      ],
    builder: (context,_) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Globals.ligth_Theme,
      darkTheme: Globals.dark_Theme,
      themeMode: (Provider.of<Theme_Provider>(context).m1.isDark)
          ? ThemeMode.dark
          : ThemeMode.light,
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