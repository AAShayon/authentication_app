import 'package:authentication_app/utils/constant/sizes.dart';
import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:authentication_app/view/screens/settings/language.dart';
import 'package:authentication_app/view/screens/settings/user_darkmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool darkvalue=false;
  bool lightvalue=false;
  bool systemvalue=false;
  @override
  Widget build(BuildContext context) {
    // final themeProvider=Provider.of<ThemeProvider>(context);
    final dark=SHelperFunctions.isDarkMode(context);
    return Scaffold(
      // backgroundColor: Colors.redAccent,
        body: Center(child: Text('Welcome to the Homepage'.tr().toString())),
        appBar: AppBar(),
        drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.only(top: SSizes.defaultSpace),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('Drawer Header'),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SHelperFunctions.screenWidth(context)*.020),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                     Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: (){
                          SHelperFunctions.navigateToScreen(context, ThemeSelect());
                        }, child: Text("Dark Theme",style: TextStyle(
                          color: dark? Colors.white:Colors.black,
                        ))),
                      dark?  Icon(Icons.anchor,color: Colors.white, ) : Icon(Icons.mode_night_outlined,color: Colors.black,),
                      ],
                    ),
                     Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: (){
                          SHelperFunctions.navigateToScreen(context, const Languagelist());
                        }, child: Text("Language   ",style: TextStyle(
                          color: dark? Colors.white:Colors.black,
                        ),)),
                      dark?  Icon(Icons.language,color: Colors.white, ) : Icon(Icons.language,color: Colors.black,),
                      ],
                    ),
                    ],

            ),
                )
          ]
        ),
    )
    );
  }
}
