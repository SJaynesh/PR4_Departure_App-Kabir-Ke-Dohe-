import 'dart:async';

import 'package:departure_code/Utills/All_Atributes.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
    });
    Size s = MediaQuery.of(context).size;
    double h = s.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(monkImagePath + "kabirdas.png",height: h * 0.2),
          ],
        ),
      ),
      backgroundColor: Color(0xff011622),
    );
  }
}
