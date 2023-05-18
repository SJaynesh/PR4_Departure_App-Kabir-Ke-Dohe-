import 'package:departure_code/Models/Lang_Model.dart';
import 'package:flutter/material.dart';

class Lang_Provider extends ChangeNotifier {

  Lang_Model l1 = Lang_Model(isBorder: false, isIndex: 1);

  ChangeIndex(val) {
    l1.isIndex = val;
    notifyListeners();
  }
}