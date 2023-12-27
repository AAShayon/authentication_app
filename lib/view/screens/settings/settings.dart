import 'package:authentication_app/provider/theme_provider.dart';
import 'package:authentication_app/utils/constant/colors.dart';
import 'package:authentication_app/utils/constant/sizes.dart';
import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:authentication_app/view/screens/settings/language.dart';
import 'package:authentication_app/view/screens/settings/user_darkmode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final rp=Provider.of<ThemeProvider>(context);
    final dark=SHelperFunctions.isDarkMode(context);
    String currentLocale = context.locale.toString();
    String languageCode = currentLocale.split('_')[0];
    String thememode=rp.themeMode.toString();
    String runningTheme=thememode.split('_')[0];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(width: SSizes.md,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Profile Details Information",style: TextStyle(
                    color: SColors.textPrimary
                  ),),
                ),
              ],
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
                      }, child: Text(" Theme",style: TextStyle(
                        color: dark? Colors.white:Colors.black,
                      ))),
                      dark?  Icon(Icons.anchor,color: Colors.white, ) : Icon(Icons.mode_night_outlined,color: Colors.black,),
                      SizedBox(width: SSizes.spaceBtwItems,),
                      Text(' ${rp.themeMode.toString().split('.')[1]}'),

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

                      SizedBox(width: SSizes.spaceBtwItems,),
                      Text(' ${languageCode.toUpperCase()}'),

                    ],
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
