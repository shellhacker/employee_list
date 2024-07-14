import 'package:flutter/material.dart';

class CommonController extends ChangeNotifier{
 int selectedIndex = 0
  ;

 changeIndex (value){
selectedIndex=value;
         notifyListeners();         
  }


}




enum  UserType{free,premium}