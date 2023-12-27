import 'package:authentication_app/view/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  bool get isLastPage => _currentPage == 2;

  void markOnboardingDone(BuildContext context) async {
    final prefs= await SharedPreferences.getInstance();
    await prefs.setBool('OnBoardingScreen', false);
    Navigator.pushReplacement(context ,
        MaterialPageRoute(builder: (context)=>const Mylogin()));
  }
}