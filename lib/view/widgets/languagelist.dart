import 'package:authentication_app/view/screens/Homepage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {


  @override
  Widget build(BuildContext context) {
    String selectedValue=context.locale.languageCode;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: "bn",
                activeColor: Colors.black,
                groupValue: selectedValue,
                onChanged: (value) {
                  context.setLocale(Locale("bn"));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()),(route) => false,);
                },
              ),
              const Text("Bangla"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "en",
                groupValue: selectedValue,
                activeColor: Colors.black,
                onChanged: (value) {
                  context.setLocale(Locale('en'));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()),(route) => false,);
                },
              ),
              const Text("English"),
            ],
          ),
        ],
      ),
    );
  }
}
