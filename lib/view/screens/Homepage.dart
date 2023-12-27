import 'package:authentication_app/utils/constant/sizes.dart';
import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:authentication_app/view/screens/settings/settings.dart';
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

    return Scaffold(
      // backgroundColor: Colors.redAccent,
        body: Center(child: Text('Welcome to the Homepage'.tr().toString())),
        appBar: AppBar(),
        drawer: Drawer(
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(top: SSizes.defaultSpace),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/logo/user.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("UserName"),
                        IconButton(onPressed: (){SHelperFunctions.navigateToScreen(context, Settings());}, icon: Icon(Icons.settings))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/logo/user.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("Add Functionality"),
                        IconButton(onPressed: (){}, icon: Icon(Icons.settings))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/logo/user.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("Add Functionality"),
                        IconButton(onPressed: (){}, icon: Icon(Icons.settings))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/logo/user.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("Add Functionality"),
                        IconButton(onPressed: (){}, icon: Icon(Icons.settings))
                      ],
                    ),
                  ),
          ]
        ),
            ),
    )
    );
  }
}
