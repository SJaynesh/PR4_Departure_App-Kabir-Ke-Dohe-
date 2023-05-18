import 'dart:convert';

import 'package:departure_code/Models/JsonData_Model.dart';
import 'package:departure_code/Utills/All_Atributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/Monk_Model.dart';

class JsonData_Provider extends ChangeNotifier {

  JsonData_Model js1 = JsonData_Model(data: "", MonkList: []);

  Future<void> LoadJsonData() async {
    js1.data = await rootBundle.loadString(JsonPath);

    List decodedList = jsonDecode(js1.data);

    js1.MonkList = decodedList.map((e) => Monk.formMap(data: e)).toList();

    notifyListeners();
  }
}