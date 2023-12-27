import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBoxProvider extends ChangeNotifier{
  bool isfillcolor=false;
  ////bool modes control true or falls////
  getInitialBoolmode()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.getBool("isfillcolor")==(false)){
      isfillcolor=false;
    }else{
      isfillcolor=true;
    }
  }
  setBoolmode(bool _bool) async{
    final prefs= await SharedPreferences.getInstance();
    if(_bool==bool.parse("false")){
      isfillcolor=_bool;
      prefs.setBool('isfillcolor', _bool);
    }else{
      isfillcolor=_bool;
      prefs.setBool('isfillcolor', _bool);
    }
    notifyListeners();
  }
}