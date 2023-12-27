import 'package:authentication_app/view/screens/Homepage.dart';
import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//
// class language extends StatelessWidget {
//   const language({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // final dark=SHelperFunctions.isDarkMode(context);
//     return SafeArea(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // ElevatedButton(
//               //     onPressed: () {
//               //       context.locale = Locale("bn");
//               //     },
//               //     child: Text(" Bangla")),
//               TextButton(onPressed: (){context.locale =Locale("bn");SHelperFunctions.navigateToScreen(context, Homepage());}, child: Text(" Bangla")),
//               const Icon(Icons.flag,color: Colors.green,)
//             ],
//           ),
//           Row(
//             children: [
//               // ElevatedButton(
//               //     onPressed: () {
//               //       context.locale = Locale("en");
//               //     },
//               //     child: Text("English")
//               // ),
//               TextButton(onPressed: (){context.locale=Locale("en");SHelperFunctions.navigateToScreen(context, Homepage());}, child:const Text("English")),
//               const Icon(Icons.flag,color: Colors.green,)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedLanguage = "en"; // Default language is English

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: "bn",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value.toString();
                    context.locale = Locale("bn");
                    SHelperFunctions.navigateToScreen(context, Homepage());
                  });
                },
              ),
              const Text("Bangla"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "en",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value.toString();
                    context.locale = Locale("en");
                    SHelperFunctions.navigateToScreen(context, Homepage());
                  });
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