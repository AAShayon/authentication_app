import 'package:authentication_app/provider/reigistration_provider.dart';
import 'package:authentication_app/utils/device/device_utility.dart';
import 'package:authentication_app/utils/helpers/helper_function.dart';
import 'package:authentication_app/view/screens/signup/regestration_image.dart';
import 'package:authentication_app/view/widgets/address_information.dart';
import 'package:authentication_app/view/widgets/clipPath.dart';
import 'package:authentication_app/view/widgets/divider.dart';
import 'package:authentication_app/view/widgets/headerlogo.dart';
import 'package:authentication_app/view/widgets/regestration_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   selectedValueDistrict = districtsItem[0];
  //   selectedValueUpozilathana = upozilasitem[0];
  //   selectedValueAreawordunion = areaItems[0];
  // }

  FocusNode firstname = FocusNode();
  FocusNode lastname = FocusNode();
  FocusNode emailaddress = FocusNode();
  FocusNode phonenumber = FocusNode();
  FocusNode shopname = FocusNode();
  FocusNode district = FocusNode();
  FocusNode upozillaThana = FocusNode();
  FocusNode areawordunion = FocusNode();
  FocusNode shopaddress = FocusNode();
  // final rp=Provider.of<RegistrationProvider>(context);

  // @override
  // void dispose() {
  //   rp.firstNameController.dispose();
  //   rp.lastNameController.dispose();
  //   rp.emailAddressController.dispose();
  //   rp.phoneNumberController.dispose();
  //   rp.shopNameController.dispose();
  //   rp.shopAddressController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dark=SHelperFunctions.isDarkMode(context);
    final rp=Provider.of<RegistrationProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF3F3F3),
          body: SingleChildScrollView(
            child: SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    ClipPathwidget(dark: dark),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: SDeviceUtlis.getScreenHeight(context)*.02,),
                        const HeaderLogo(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: SDeviceUtlis.getScreenWidth(context)*.045),
                          margin: EdgeInsets.symmetric(horizontal:SDeviceUtlis.getScreenWidth(context)*.02),
                          width: SDeviceUtlis.getScreenWidth(context),
                          height: height * .80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:dark?Colors.lightBlueAccent : Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Become a seller".tr().toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334257)),
                              ),
                              Text(
                                "Welcome to seller Registration".tr().toString(),
                                style: TextStyle(fontSize: SDeviceUtlis.getScreenHeight(context)*.020,color: Color(0xff667180)),
                              ),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.005,
                              ),
                              const gDivider(),
                              SizedBox(
                                height: SDeviceUtlis.getScreenHeight(context)*.001,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.only(left: SDeviceUtlis.getScreenWidth(context)*.02),
                                      child: Text(
                                        "Seller info".tr().toString(),
                                        style: TextStyle(
                                          fontSize: SDeviceUtlis.getScreenHeight(context)*.017,
                                          color: Color(0xff334257),
                                        ),

                                      ),
                                    ),

                                    ///Fisrt name with Text Field property
                                    RegistrationForm(nameOfController:rp.firstNameController,onchanged: (value){
                                      rp.validateFirstname(value);
                                    },focusNode: firstname,nextFocusNode: lastname,yourFieldText: 'First Name'),
                                    rp.isFirstNameError ? Text("${rp.isFirstNameError}", style: TextStyle(color: Colors.redAccent,),) : SizedBox.shrink(),
                                    SizedBox(
                                      height: 2,
                                    ),

                                    RegistrationForm(nameOfController:rp.lastNameController,onchanged: (value){
                                      rp.validateLastname(value);
                                    },focusNode: lastname,nextFocusNode: emailaddress,yourFieldText: 'last Name'),
                                    rp.isLastNameError ? Text("${rp.lastnameErrorText}", style: TextStyle(color: Colors.redAccent),) : SizedBox.shrink(),
                                    SizedBox(height: 2,),
                                    RegistrationForm(nameOfController:rp.emailAddressController,onchanged: (value){
                                      rp.validateEmail(value);
                                    },focusNode: emailaddress,nextFocusNode: phonenumber,yourFieldText: 'Email address'),
                                    rp.isEmailAddressError ? Text("${rp.emailAddressErrorText}", style: TextStyle(color: Colors.redAccent),) : SizedBox.shrink(),
                                   SizedBox(height: 2,),
                                    RegistrationForm(yourFieldText: 'Phone Number', focusNode: phonenumber, nameOfController: rp.phoneNumberController, onchanged: (value){
                                      rp.validatePhoneNumber(value);
                                    }),
                                    rp.isPhoneNumberError
                                        ? Text("${rp.phoneNumberErrorText}", style: TextStyle(color: Colors.redAccent),) : SizedBox.shrink(),
                                    SizedBox(
                                      height: SDeviceUtlis.getScreenHeight(context)*.005,
                                    ),
                                    const gDivider(),
                                    SizedBox(
                                      height: SDeviceUtlis.getScreenHeight(context)*.005,
                                    ),
                                    ////////////////////////Shopname/////////////////
                                    ///
                                    RegistrationForm(yourFieldText: 'Shop name', focusNode: shopname, nameOfController: rp.shopNameController, onchanged: (value){
                                      rp.validateShopName(value);
                                    }),
                                    rp.isShopNameError ? Text("${rp.shopNameErrorText}",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ))
                                        : SizedBox.shrink(),
                                    SizedBox(height: 2),

                                    CustomDropdown(label: "District/City", items: rp.districtsItem, selectedValue: rp.selectedValueDistrict ?? rp.districtsItem.first, onChanged: (value){rp.validateDistrict(value);}, isError: rp.isDistrictError),
                                    // isdistrictError?Text("${selectedValueDistrict}"):SizedBox.shrink(),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    CustomDropdown(label:"Upozilla/Thana" , items: rp.upoZilaItem, selectedValue: rp.selectedValueUpozilaThana ?? rp.upoZilaItem.first, onChanged: (value){rp.validateUpoZillaThana(value);}, isError: rp.isUpozilaThanaError),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    CustomDropdown(label:"Area/Word/Union", items: rp.areaItems, selectedValue: rp.selectedValueAreaWordUnion ?? rp.areaItems.first, onChanged: (value){rp.validateAreaWordUnion(value);}, isError: rp.isAreaWardUnionError),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: SDeviceUtlis.getScreenWidth(context)*.009,
                                          right: SDeviceUtlis.getScreenWidth(context)*.010),
                                      child: Container(
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          focusNode: shopaddress,
                                          maxLines: 1,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(30),
                                          ],
                                          onChanged: (value) {rp.validateShopAddress(value);
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          controller: rp.shopAddressController,
                                          decoration: InputDecoration(
                                            hintText: "Add shop Address".tr().toString(),
                                            border:OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            )
                                          ),
                                          // validator: _validateShopadd,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: rp.isShopAddressError? Colors.red:Colors.blueAccent,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    rp.isShopAddressError
                                        ? Text(
                                            "${rp.shopAddressErrorText}",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(height: 2),
                                    ElevatedButton(
                                      onPressed:(){rp.allValidate(context);},
                                      child: Text(
                                        "Next".tr().toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SDeviceUtlis.getScreenHeight(context) * .018,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Already Have a Account".tr().toString(), style: TextStyle(color: Color(0xff667180),
                                            fontSize: SDeviceUtlis.getScreenHeight(context)*.015)),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         Imageregistration()),
                                              );
                                            },
                                            child: Text(
                                              "Login".tr().toString(),
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: SDeviceUtlis.getScreenHeight(context)*.016,fontWeight: FontWeight.bold,
                                                // decoration: TextDecoration.underline,),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
