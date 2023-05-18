import 'package:departure_code/Utills/All_Atributes.dart';
import 'package:flutter/material.dart';

import '../../Controllers/CarousalSlider_Provider.dart';
import '../../Controllers/Lang_Provider.dart';
import '../../Controllers/Theme_Provider.dart';
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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(bgImagePath + "img.png"),fit: BoxFit.cover),
            ),
          ),
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
                    icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.brown,size: h * 0.03,),
                  ),
                  (Provider.of<Lang_Provider>(context).l1.isIndex == 1)
                      ? Text(
                    "${data.NameHindi}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      : (Provider.of<Lang_Provider>(context).l1.isIndex == 2)
                      ? Text(
                    "${data.NameEng}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      : (Provider.of<Lang_Provider>(context).l1.isIndex == 3)
                      ? Text(
                    "${data.NameGujrati}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: h * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      : Text(""),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (context) => Container(
                          height: h * 0.5,
                          decoration: BoxDecoration(
                            color: Color(0xffe2c393),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                leading:
                                (Provider.of<Theme_Provider>(context)
                                    .m1
                                    .isDark)
                                    ? Icon(
                                  Icons.light_mode_rounded,
                                  color: Colors.white,
                                  size: h * 0.04,
                                )
                                    : Icon(
                                  Icons.dark_mode,
                                  color: Colors.black45,
                                  size: h * 0.04,
                                ),
                                title: Text(
                                  "Theme",
                                  style: TextStyle(
                                    fontSize: h * 0.03,
                                    // color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  "Change Theme",
                                  style: TextStyle(
                                    fontSize: h * 0.02,
                                    // color: Colors.black54,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                trailing: Switch(
                                  value:
                                  Provider.of<Theme_Provider>(context)
                                      .m1
                                      .isDark,
                                  onChanged: (val) {
                                    Provider.of<Theme_Provider>(context,
                                        listen: false)
                                        .changeTheme();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap : () {
                                        Provider.of<Lang_Provider>(context,listen: false).ChangeIndex(1);
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: h * 0.07,
                                        width: w * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: Border.all(
                                            color:
                                            (Provider.of<Lang_Provider>(context).l1.isIndex == 1)
                                                ? Colors.pink
                                                : Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "हिंदी",
                                          style: TextStyle(
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.bold,
                                            color: (Provider.of<Lang_Provider>(context).l1.isIndex == 1)
                                                ? Colors.pink
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap : () {
                                        Provider.of<Lang_Provider>(context,listen: false).ChangeIndex(2);
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: h * 0.07,
                                        width: w * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: Border.all(
                                            color: (Provider.of<Lang_Provider>(context).l1.isIndex == 2)
                                                ? Colors.pink
                                                : Colors.black, width: 2,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "English",
                                          style: TextStyle(
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.bold,
                                            color: (Provider.of<Lang_Provider>(context).l1.isIndex == 2)
                                                ? Colors.pink
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap : () {
                                        Provider.of<Lang_Provider>(context,listen: false).ChangeIndex(3);
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: h * 0.07,
                                        width: w * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: Border.all(
                                            color: (Provider.of<Lang_Provider>(context).l1.isIndex == 3)
                                                ? Colors.pink
                                                : Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ગુજરાતી",
                                          style: TextStyle(
                                            fontSize: h * 0.025,
                                            fontWeight: FontWeight.bold,
                                            color: (Provider.of<Lang_Provider>(context).l1.isIndex == 3)
                                                ? Colors.pink
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.dashboard,color: Colors.brown,size: h * 0.03,),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: h * 0.32,
            left: w * 0.06,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(bgImagePath + "detail.png"),
            ),
          ),
          Positioned(
            top: h * 0.43,
            left: w * 0.12,
            child: (Provider.of<Lang_Provider>(context).l1.isIndex == 1)
                ? Text(
              "${data.Gist[Provider.of<CarousalSlider_Provider>(context).cm1.i]['GistHindi']}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.018,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : (Provider.of<Lang_Provider>(context).l1.isIndex == 2)
                ? Text(
              "${data.Gist[Provider.of<CarousalSlider_Provider>(context).cm1.i]['GistEnd']}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.017,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : (Provider.of<Lang_Provider>(context).l1.isIndex == 3)
                ? Text(
              "${data.Gist[Provider.of<CarousalSlider_Provider>(context).cm1.i]['GistGujrati']}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.017,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : Text(""),
          )
        ],
      )),
    );
  }
}
