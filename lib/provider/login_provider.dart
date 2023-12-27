import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:authentication_app/view/screens/Homepage.dart';
import'package:flutter/material.dart';
class LoginProvider extends ChangeNotifier{
  bool isMobileNoError=false;
  String? mobileErrorText;
  bool isPasswordError=false;
  String? passwordErrorText;
  bool isChecked = false;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
        isMobileNoError = true;
        mobileErrorText = 'Please Enter a Valid number';
      return 'Please Enter a Valid number';
    }
    RegExp phonregex = RegExp(r'^(01|\+880)\d{9,12}$');
    if (!phonregex.hasMatch(value)) {
        isMobileNoError = true;
        mobileErrorText = 'Enter Correct Phone number';
      return 'Enter Correct Phone number';
    }
    else {
        isMobileNoError = false;
        mobileErrorText = '';
    }
   notifyListeners();
  }
  String? validatePassword(value){
    if(value!.isEmpty){
        isPasswordError=true;
        passwordErrorText='Enter valid password';
      return 'Enter valid password';
    }
    else if(value.length!<8){
        isPasswordError=true;
        passwordErrorText='More than 8 Character';
      return 'More than 8 Character';
    }

    else{
        isPasswordError=false;
        passwordErrorText='';
    }
   notifyListeners();
  }
  void allValidate(context){
    if(phoneNumberController.text.isNotEmpty && passWordController.text.isNotEmpty ){

        isMobileNoError=false;
        mobileErrorText='';
        isPasswordError=false;
        passwordErrorText='';

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Newone()),)
      SHelperFunctions.navigateToScreen(context,const Homepage());
    }else{
      if(phoneNumberController.text.isEmpty){

          isMobileNoError=true;
          mobileErrorText='Enter valid Mobile No';
      }
      if(passWordController.text.isEmpty){
          isPasswordError=true;
          passwordErrorText='Enter valid password';
      }
    }
  }
}