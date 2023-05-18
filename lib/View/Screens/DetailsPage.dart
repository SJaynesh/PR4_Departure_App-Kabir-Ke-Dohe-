import 'package:departure_code/Utills/All_Atributes.dart';
import 'package:flutter/material.dart';

import '../../Controllers/CarousalSlider_Provider.dart';
import '../../Models/Monk_Model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Monk data = ModalRoute.of(context)!.settings.arguments as Monk;
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              height: h * 0.085,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bgImagePath + "Title.png"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Text(
                    "${data.NameHindi}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.dashboard),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(bgImagePath + "detail.png"),
            ),
          ),
          Positioned(
            top: h * 0.3,
            left: w * 0.12,
            child: Text(
              "${data.Gist[Provider.of<CarousalSlider_Provider>(context).cm1.i]['GistGujrati']}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.022,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
