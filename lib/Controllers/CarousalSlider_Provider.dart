import 'package:departure_code/Models/CarouselSlider_Model.dart';
import 'package:flutter/material.dart';

class CarousalSlider_Provider extends ChangeNotifier {

  CarousalSlider_Model cm1 = CarousalSlider_Model(index: null,i :0);

  GetIndex(val) {
    cm1.index = val;

    notifyListeners();
  }

  GetIndexDetail(val) {
    cm1.i = val;

    notifyListeners();
  }
}