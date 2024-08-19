import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{

  int totalPrice=0;
  int  index=0;


  Future<void> changePrice(int newPrice) async {
    if(totalPrice==newPrice)return;
    totalPrice=newPrice;
    notifyListeners();
  }
   Future<void> changeIndex(int newIndex) async {
     if(index==newIndex)return;
    index=newIndex;
     notifyListeners();
  }

}
