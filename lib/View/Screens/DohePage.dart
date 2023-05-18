import 'package:departure_code/Controllers/CarousalSlider_Provider.dart';
import 'package:flutter/material.dart';

import '../../Models/Monk_Model.dart';
import '../../Utills/All_Atributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DohePage extends StatefulWidget {
  const DohePage({Key? key}) : super(key: key);

  @override
  State<DohePage> createState() => _DohePageState();
}

class _DohePageState extends State<DohePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    Monk data = ModalRoute.of(context)!.settings.arguments as Monk;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(data.Image),fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Colors.black26,
            ),
            Column(
              children: [
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
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
                SizedBox(
                  height: h * 0.025,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.Dohe.length,
                    itemBuilder: (context, i) => Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<CarousalSlider_Provider>(context,listen: false).GetIndexDetail(i);
                            Navigator.of(context).pushNamed("DetailsPage",arguments: data);
                          },
                          child: Transform.scale(
                            scale: 1.35,
                            child: Image.asset(
                              bgImagePath + "list.png",
                            ),
                          ),
                        ),
                        Positioned(
                          top: h * 0.1,
                          left: w * 0.14,
                          child: Text(
                            "${data.Dohe[i]['DoheHindi']}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: h * 0.017,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
