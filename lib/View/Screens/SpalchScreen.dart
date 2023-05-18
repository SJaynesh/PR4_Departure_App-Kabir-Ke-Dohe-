import 'dart:async';

import 'package:departure_code/Utills/All_Atributes.dart';
import 'package:flutter/material.dart';

import '../../Controllers/Theme_Provider.dart';
import 'package:provider/provider.dart';

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
    double w = s.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(),
            Container(
              height: h * 0.25,
              width: w * 0.37,
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(monkImagePath + "Kabirdas2.png"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color:  (Provider.of<Theme_Provider>(context)
                      .m1
                      .isDark) ? Colors.white : Colors.black,
                  width: 3,
                ),
              ),
            ),
            Positioned(
              top: h * 0.6,
              left: w * 0.32,
              child: Text(
                "कबीर",
                style: TextStyle(
                  fontSize: h * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: h * 0.67,
              left: w * 0.35,
              child: Text(
                "केे         ",
                style: TextStyle(
                  fontSize: h * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: h * 0.67,
              left: w * 0.43,
              child: Text(
                "दोहे",
                style: TextStyle(
                  fontSize: h * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
