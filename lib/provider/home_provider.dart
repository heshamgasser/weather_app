import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  String? cityName;

  void getCityName (String name){
    if (name == cityName) return;
    cityName = name;
    notifyListeners();
  }




}