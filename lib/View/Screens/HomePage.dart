import 'dart:async';

import 'package:departure_code/Controllers/CarousalSlider_Provider.dart';
import 'package:departure_code/Controllers/JsonData_Provider.dart';
import 'package:flutter/material.dart';

import '../../Controllers/Lang_Provider.dart';
import '../../Utills/All_Atributes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Provider.of<JsonData_Provider>(context, listen: false).LoadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      CircularProgressIndicator();
    });
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.3,
                  width: w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfff7c611),
                        Color(0xffffd72a),
                        Color(0xfff7b215),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(h * 0.2),
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.06,
                  left: w * 0.085,
                  child: Text(
                    "कबीर",
                    style: TextStyle(
                      fontSize: h * 0.065,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.14,
                  left: w * 0.12,
                  child: Text(
                    "केे         ",
                    style: TextStyle(
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.14,
                  left: w * 0.22,
                  child: Text(
                    "दोहे",
                    style: TextStyle(
                      fontSize: h * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: w * 0.6,
                  child: Container(
                    height: h * 0.295,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(h * 0.25),
                      ),
                      image: DecorationImage(
                        image: AssetImage(monkImagePath + "kabirdas.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.08,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("DohePage",
                    arguments:
                        Provider.of<JsonData_Provider>(context, listen: false)
                            .js1
                            .MonkList[Provider.of<CarousalSlider_Provider>(
                                context,
                                listen: false)
                            .cm1
                            .index!]);
              },
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlay: true,
                  onPageChanged: (val, _) {
                    Provider.of<CarousalSlider_Provider>(context, listen: false)
                        .GetIndex(val);
                  },
                ),
                items: Provider.of<JsonData_Provider>(context)
                    .js1
                    .MonkList
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(e.Image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            (Provider.of<CarousalSlider_Provider>(context).cm1.index != null)
                ? (Provider.of<Lang_Provider>(context).l1.isIndex == 1)
                    ? Text(
                        "${Provider.of<JsonData_Provider>(context).js1.MonkList[Provider.of<CarousalSlider_Provider>(context).cm1.index!].NameHindi}",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : (Provider.of<Lang_Provider>(context).l1.isIndex == 2)
                        ? Text(
                            "${Provider.of<JsonData_Provider>(context).js1.MonkList[Provider.of<CarousalSlider_Provider>(context).cm1.index!].NameEng}",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: h * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : (Provider.of<Lang_Provider>(context).l1.isIndex == 3)
                            ? Text(
                                "${Provider.of<JsonData_Provider>(context).js1.MonkList[Provider.of<CarousalSlider_Provider>(context).cm1.index!].NameGujrati}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Text("")
                : Text(""),
          ],
        ),
      ),
    );
  }
}
