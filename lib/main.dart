import 'package:authentication_app/provider/login_provider.dart';
import 'package:authentication_app/provider/onBoarding_provider.dart';
import 'package:authentication_app/provider/reigistration_provider.dart';
import 'package:authentication_app/utils/theme/theme.dart';
import 'package:authentication_app/view/screens/loginscreen.dart';
import 'package:authentication_app/view/screens/onBoarding_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/checkBox_provider.dart';
import 'provider/theme_provider.dart';
bool show =true;
// const MethodChannel _channel = MethodChannel('Authentication');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs= await SharedPreferences.getInstance();
  show = prefs.getBool('OnBoardingScreen') ?? true;
  runApp(
      EasyLocalization(child: Myapp(), supportedLocales: [
        Locale("en",""),
        Locale("bn",""),
      ],
          path: 'lib/localization/language')
    // const Myapp()
  );
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return MultiProvider(
              providers:[
            ChangeNotifierProvider<ThemeProvider>(create: (_)=>ThemeProvider(),),
            ChangeNotifierProvider<CheckBoxProvider>(create:(_)=>CheckBoxProvider(), ),
            ChangeNotifierProvider<OnboardingProvider>(create:(_)=>OnboardingProvider(),),
            ChangeNotifierProvider<RegistrationProvider>(create:(_)=>RegistrationProvider(),),
            ChangeNotifierProvider<LoginProvider>(create: (_)=>LoginProvider(),),
              ],builder:(context,_){
            final themeProvider=Provider.of<ThemeProvider>(context);
            themeProvider.getInitialThemeMode();
            final checkBoxProvider=Provider.of<CheckBoxProvider>(context);
            checkBoxProvider.getInitialBoolmode();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // themeMode: ThemeMode.system,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              theme: SAppTheme.lighttheme,
              darkTheme: SAppTheme.darktheme,
              themeMode: themeProvider.themeMode,
              home:show? OnBoardingScreen() : const Mylogin() ,
            );


          });
        });
  }
  
}