import 'package:authentication_app/provider/login_provider.dart';
import 'package:authentication_app/view/screens/Homepage.dart';
import 'package:authentication_app/utils/device/device_utility.dart';
import 'package:authentication_app/view/screens/signup/registration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/helpers/helper_function.dart';
import '../widgets/clipPath.dart';
import '../widgets/divider.dart';
import '../widgets/headerlogo.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}
class _MyloginState extends State<Mylogin> {
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    final rp=Provider.of<LoginProvider>(context);
    return GestureDetector(
       onTap: (){
         FocusScopeNode currentFocus=FocusScope.of(context);
         if(!currentFocus.hasPrimaryFocus){
           currentFocus.unfocus();
         }
       },
      child: SafeArea(
        child: Scaffold(
           resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xffF3F3F3),
          body: SingleChildScrollView(
            child: Container(
              height: SDeviceUtlis.getScreenHeight(context) ,
              width: SDeviceUtlis.getScreenWidth(context) ,
              child: Center(
                child: Stack(
                  children: [
                    ClipPathwidget(dark: dark),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: SDeviceUtlis.getScreenHeight(context)*.015,),
                        const  HeaderLogo(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:SDeviceUtlis.getScreenWidth(context) * .010),
                          margin: EdgeInsets.symmetric(horizontal: SDeviceUtlis.getScreenWidth(context)*.030),
                          width: SDeviceUtlis.getScreenWidth(context),
                          height: SDeviceUtlis.getScreenHeight(context) * .5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Color(0xFFFFFFFF)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in".tr().toString(),
                                style: TextStyle(
                                    fontSize: SDeviceUtlis.getScreenHeight(context)*.025,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334257)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.001,
                              ),
                              Text(
                                "Welcome to seller Login".tr().toString(),
                                style: TextStyle(fontSize: SDeviceUtlis.getScreenHeight(context)*.020,color: Color(0xff667180)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.010,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SDeviceUtlis.getScreenWidth(context)*.008, right:SDeviceUtlis.getScreenWidth(context)*.008),
                                child:const gDivider(),
                              ),
                              SizedBox(
                                height:SDeviceUtlis.getScreenHeight(context)*.005,
                              ),
                              SingleChildScrollView(
                                child: Form(
                                  key: _formKey1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: SDeviceUtlis.getScreenWidth(context)*.02),
                                        child: Text(
                                          "Mobile".tr().toString(),
                                          style: TextStyle(
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                            color: Color(0xff334257),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: SDeviceUtlis.getScreenHeight(context) *.06,
                                        width: SDeviceUtlis.getScreenWidth(context) * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: rp.isMobileNoError?Colors.red:Colors.blue,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: rp.phoneNumberController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            hintText: "Enter mobile Number".tr().toString(),
                                          ),
                                          onChanged: (value){
                                           rp.validatePhoneNumber(value);
                                          },
                                        ),
                                      ),
                                      rp.isMobileNoError?Text("${rp.mobileErrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                                     // SizedBox(height: 10,),
                                      Padding(
                                        padding: EdgeInsets.only(left:SDeviceUtlis.getScreenWidth(context)*.02),
                                        child: Text(
                                          "Password".tr().toString(),
                                          style: TextStyle(
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                            color: Color(0xff334257),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: SDeviceUtlis.getScreenHeight(context) * .06,
                                        width: SDeviceUtlis.getScreenWidth(context) * .6,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: rp.isPasswordError?Colors.red : Colors.blue,
                                          ),borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          obscureText: true,
                                          controller: rp.passWordController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            hintText: "Enter Password".tr().toString(),
                                          ),
                                          // validator: _validatePassword,
                                          onChanged: (value){
                                            rp.validatePassword(value);
                                          },
                                        ),
                                      ),
                                      rp.isPasswordError?Text("${rp.passwordErrorText}",style: TextStyle(color: Colors.redAccent),):SizedBox.shrink(),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Row(
                                           children: [
                                             Checkbox(
                                               value: rp.isChecked,
                                               onChanged: (bool? value) {
                                                 setState(() {
                                                   rp.isChecked = value!;
                                                 });
                                               },
                                             ),
                                             Text("Remember me".tr().toString(), style: TextStyle(color:Color(0xffB2B2B2),fontSize: SDeviceUtlis.getScreenHeight(context)*.016),),
                                           ],
                                         ),
                                          TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        child: AlertDialog(
                                                            title: Text(
                                                                "Enter Phone number"),
                                                            content: TextFormField(
                                                              keyboardType: TextInputType.number,
                                                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                                                              controller: rp.phoneNumberController,
                                                              decoration: InputDecoration(
                                                                filled: true,
                                                                border: OutlineInputBorder(
                                                                  borderSide: BorderSide.none,
                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                hintText: "Enter mobile Number".tr().toString(),
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "ok"))
                                                            ]),
                                                      );
                                                    });
                                              },
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  "Forget Password ?".tr().toString(),
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,fontSize: SDeviceUtlis.getScreenHeight(context)*.016
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.060,
                                width: SDeviceUtlis.getScreenWidth(context),
                                child: ElevatedButton(
                                    onPressed:(){
                                      rp.allValidate(context);
                                    },
                                  child: Text("Sign in".tr().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: SDeviceUtlis.getScreenWidth(context) * .025,
                                    ),)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Become a seller".tr().toString(),
                                    style: TextStyle(color: Color(0xff667180),
                                    fontSize: SDeviceUtlis.getScreenHeight(context)*.015),),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registration()),
                                        );
                                      },
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.016,fontWeight: FontWeight.bold,
                                          // decoration: TextDecoration.underline,),
                                      )))
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextButton(onPressed: (){
                          SHelperFunctions.navigateToScreen(context, Homepage());
                        }, child: Text('Go'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





