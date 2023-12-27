import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../view/screens/Homepage.dart';
import '../view/screens/signup/regestration_image.dart';

class RegistrationProvider extends ChangeNotifier {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  bool ischeckd = false;
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  File? imageFile;
  String? imageName;
  File? imageBanner;
  String? imageBannerName;
  String? firstnameErrorText;
  bool isFirstNameError = false;
  String? lastnameErrorText;
  bool isLastNameError = false;
  String? emailAddressErrorText;
  bool isEmailAddressError = false;
  String? phoneNumberErrorText;
  bool isPhoneNumberError = false;
  String? shopNameErrorText;
  bool isShopNameError = false;
  String? shopAddressErrorText;
  bool isShopAddressError = false;
  String? selectedValueDistrict;
  bool isDistrictError = false;
  String? selectedValueUpozilaThana;
  bool isUpozilaThanaError = false;
  String? selectedValueAreaWordUnion;
  bool isAreaWardUnionError = false;
  String? passwordErrorText = '';
  String? repasswordErrorText = '';
  bool ispasserror = false;
  bool isrepasserror = false;


  List<String> districtsItem = [
    'Select District',
    'Dhaka',
    'Khulna',
    'Rajshahi',
    'Chittagram',
  ];
  List<String> upoZilaItem = [
    "Select Union",
    'Metro 1',
    'Metro 2',
    'Metro 3',
    'Metro 4',
  ];
  List<String> areaItems = [
    "Select Area",
    'Area 1',
    'Area 2',
    'Area 3',
    'Area 4',
  ];

  void validateDistrict(String selectedDistrict) {
    if (selectedDistrict.isEmpty) {
      selectedValueDistrict = districtsItem[0];
      isDistrictError = true;
    } else {
      if (selectedDistrict == districtsItem[0]) {
        selectedValueDistrict = districtsItem[0];
        isDistrictError = true;
      } else {
        selectedValueDistrict = selectedDistrict;
        isDistrictError = false;
      }
    }
    notifyListeners();
  }

  void validateUpoZillaThana(String selectedUpozila) {
    if (selectedUpozila.isEmpty) {
      selectedValueUpozilaThana = upoZilaItem[0];
      isUpozilaThanaError = true;
    } else {
      if (selectedUpozila == upoZilaItem[0]) {
        selectedValueUpozilaThana = upoZilaItem[0];
        isUpozilaThanaError = true;
      } else {
        selectedValueUpozilaThana = selectedUpozila;
        isUpozilaThanaError = false;
      }
    }
    notifyListeners();
  }

  void validateAreaWordUnion(String selectedArea) {
    if (selectedArea.isEmpty) {
      selectedValueAreaWordUnion = areaItems[0];
      isAreaWardUnionError = true;
    } else {
      if (selectedArea == areaItems[0]) {
        selectedValueAreaWordUnion = areaItems[0];
        isAreaWardUnionError = true;
      } else {
        selectedValueAreaWordUnion = selectedArea;
        isAreaWardUnionError = false;
      }
    }
    notifyListeners();
  }

  String? validateFirstname(value) {
    RegExp firstNameRegexp = RegExp(r'^[a-zA-Z\s]{3,10}$');
    if (value!.isEmpty || value.length > 10) {
      firstnameErrorText = 'Please enter Your First Name';
      isFirstNameError = true;
      return 'Please Enter your First Name';
    } else if (!firstNameRegexp.hasMatch(value)) {
      firstnameErrorText = "Please enter a Valid Name";
      isFirstNameError = true;
      return 'Enter a Valid Name';
    } else {
      isFirstNameError = false;
      firstnameErrorText = "";
    }
    notifyListeners();
  }

  String? validateLastname(value) {
    RegExp lnregex = RegExp(r'^[a-zA-Z\s]{3,10}$');
    if (value!.isEmpty || value.length > 10) {
      lastnameErrorText = 'Please enter Your Last Name';
      isLastNameError = true;
      return 'Please Enter your Last Name';
    } else if (!lnregex.hasMatch(value)) {
      lastnameErrorText = "Please enter a Valid Name";
      isLastNameError = true;
      return 'Enter a Valid Name';
    } else {
      isLastNameError = false;
      lastnameErrorText = "";
    }
    notifyListeners();
  }

  String? validateEmail(value) {
    RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value!.isEmpty) {
      emailAddressErrorText = 'Please enter your email';
      isEmailAddressError = true;
      return 'Please enter your email';
    } else if (!emailRegExp.hasMatch(value)) {
      emailAddressErrorText = 'Please Enter a Valid Email';
      isEmailAddressError = true;
      return 'Please Enter a Valid Email';
    } else {
      emailAddressErrorText = '';
      isEmailAddressError = false;
    }
    notifyListeners();
  }

  String? validatePhoneNumber(value) {
    RegExp phoneRegex = RegExp(r'^(01|\+880)\d{9,13}$');
    if (value!.isEmpty || value.length > 14) {
      isPhoneNumberError = true;
      phoneNumberErrorText = 'Please enter a phone Number';

      return 'Please enter a phone Number';
    } else if (!phoneRegex.hasMatch(value)) {
      isPhoneNumberError = true;
      phoneNumberErrorText = 'Please Enter a Valid Phone number';
      return 'Please Enter a Valid Phone Number';
    } else {
      isPhoneNumberError = false;
      phoneNumberErrorText = '';
    }
    notifyListeners();
  }

  String? validateShopName(value) {
    if (value!.isEmpty) {
      shopNameErrorText = 'Enter Your Shop Name';
      isShopNameError = true;
      return 'Enter a Valid Shop Name';
    } else {
      shopNameErrorText = "";
      isShopNameError = false;
    }
    notifyListeners();
  }

  String? validateShopAddress(value) {
    RegExp shopaddregex = RegExp(r'^[a-zA-Z0-9\s&(),.!-]+$');
    if (value!.isEmpty) {
      shopAddressErrorText = "Enter Your Shop Address";
      isShopNameError = true;
      return 'Enter a Valid Shop Address';
    } else if (!shopaddregex.hasMatch(value)) {
      shopAddressErrorText = "Please enter a valid shop address ";
      isShopAddressError = true;
      return 'Please Enter a Valid Shop Address ';
    } else {
      shopAddressErrorText = "";
      isShopAddressError = false;
    }
    notifyListeners();
  }

  void allValidate(BuildContext context) {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailAddressController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        shopNameController.text.isNotEmpty &&
        shopAddressController.text.isNotEmpty &&
        isDistrictError != true &&
        isUpozilaThanaError != true &&
        isAreaWardUnionError != true) {
      isFirstNameError = false;
      firstnameErrorText = '';
      isLastNameError = false;
      lastnameErrorText = '';
      isEmailAddressError = false;
      emailAddressErrorText = '';
      isPhoneNumberError = false;
      phoneNumberErrorText = '';
      isShopNameError = false;
      shopNameErrorText = '';
      isShopAddressError = false;
      shopAddressErrorText = '';
      isDistrictError = false;
      isUpozilaThanaError = false;
      isAreaWardUnionError = false;
      selectedValueDistrict = districtsItem[0];
      selectedValueUpozilaThana = upoZilaItem[0];
      selectedValueAreaWordUnion = areaItems[0];

      print("Navigating to the next screen...");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Imageregistration(),
        ),
      );
    } else {
      if (firstNameController.text.isEmpty) {
        firstnameErrorText = 'Please Enter a Valid Name';
        isFirstNameError = true;
      }
      if (lastNameController.text.isEmpty) {
        isLastNameError = true;
        lastnameErrorText = 'Please Enter a Valid Name';
      }
      if (emailAddressController.text.isEmpty) {
        isEmailAddressError = true;
        emailAddressErrorText = 'Please Enter a Valid Email';
      }
      if (phoneNumberController.text.isEmpty) {
        isPhoneNumberError = true;
        phoneNumberErrorText = "Enter Phone number Start with 01 or +880";
      }
      if (shopNameController.text.isEmpty) {
        isShopNameError = true;
        shopNameErrorText = 'Enter Valid Shop Name';
      }
      if (shopAddressController.text.isEmpty) {
        isShopAddressError = true;
        shopAddressErrorText = 'Enter Correct Address';
      }

      if (selectedValueDistrict == districtsItem[0]) {
        isDistrictError = true;
      }
      if (selectedValueUpozilaThana == upoZilaItem[0]) {
        isUpozilaThanaError = true;
      }
      if (selectedValueAreaWordUnion == areaItems[0]) {
        isAreaWardUnionError = true;
      }
    }
    notifyListeners();
  }
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (source == ImageSource.gallery) {
      if (pickedFile != null) {
        final File pickedImage = File(pickedFile.path);
        // Check if the image has a 1:1 aspect ratio (square)
        final imageBytes = await pickedImage.readAsBytes();
        final decodedImage = await decodeImageFromList(imageBytes);
        final imageFileName = path.basename(pickedImage.path);

        if (decodedImage.width == decodedImage.height) {
            imageFile = pickedImage;
            imageName = path.basename(imageFileName).split('/').last;
        } else {
          // Show an error message or handle non-square images
          showDialog(
            context: context as BuildContext,
            builder: (context) {
              return AlertDialog(
                title: Text('Invalid Image Aspect Ratio'),
                content: Text(
                    'Please select an image with a 1:1 aspect ratio (square).'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } else if (source == ImageSource.camera) {
      if (pickedFile != null) {
        final imageFileName = path.basename(pickedFile.path);
        CroppedFile? cropped = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Crop',
                  cropGridColor: Colors.black,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: true),
              IOSUiSettings(title: 'Crop')
            ]);

        if (cropped != null) {
            imageFile = File(cropped.path);
            // _imageName = imageFileName;
            imageName = path.basename(imageFileName).split('/').last;
        }
      }
    }
  }
  Future<void> pickBanner(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (source == ImageSource.gallery) {
      if (pickedFile != null) {
        final File pickedBImage = File(pickedFile.path);
        // Check if the image has a 6:1 aspect ratio (square)
        final imageBytes = await pickedBImage.readAsBytes();
        final decodedImage = await decodeImageFromList(imageBytes);
        final imageFileName = path.basename(pickedBImage.path);
        // log("check image width=======> ${decodedImage.width}");
        // log("check image height=======> ${decodedImage.height*6}");
        if (decodedImage.width == decodedImage.height * 6) {
            imageBanner = pickedBImage;
            imageBannerName = imageFileName;
        } else {
          // Show an error message or handle non-square images
          showDialog(
            context: context as BuildContext,
            builder: (context) {
              return AlertDialog(
                title: Text('Invalid Image Aspect Ratio'),
                content:
                Text('Please select an image with a 6:1 aspect ratio '),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } else if (source == ImageSource.camera) {
      if (pickedFile != null) {
        final imageFileName1 = path.basename(pickedFile.path);
        CroppedFile? croppedB = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: CropAspectRatio(ratioX: 6, ratioY: 1),
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Crop',
                  cropGridColor: Colors.black,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: true),
              IOSUiSettings(title: 'Crop')
            ]);

        if (croppedB != null) {
            imageBanner = File(croppedB.path);
            imageBannerName = imageFileName1;
        }
      }
    }
  }

  void imageValidate(BuildContext context) {
    if (passwordController.text.isNotEmpty &&
        rePasswordController
            .text.isNotEmpty &&
        ischeckd != false &&
        imageBanner != null &&
        imageFile != null) {

        ispasserror=false;
        isrepasserror=false;


      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Homepage()));
    }
    else{
      if(passwordController.text.isEmpty){
          ispasserror=true;
          passwordErrorText='Enter Password';
      }
      if(rePasswordController.text.isEmpty){
        isrepasserror=true;
        repasswordErrorText="Please Enter your password and matching";
      }
    }
  }
  // Future<void> _showErrorDialog(BuildContext context,String title, String content) async {
  //   showDialog(
  //     context: context ,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(content),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  String? validatePassword(value) {
    if (value!.isEmpty) {
        passwordErrorText = 'Please Enter password';
        ispasserror = true;

      return 'Please Enter a Password';
    }
    else {
      if (value.length! < 8) {
          passwordErrorText = 'Enter Password more than 8 Character';
          ispasserror = true;
        return 'Enter Password more than 8 Character';
      }
      else if (value != rePasswordController.text) {

          repasswordErrorText = 'Enter Correct pass';
          isrepasserror = true;

        return 'Please Match your password';
      }
      else {
          passwordErrorText ='';
          ispasserror = false;
          isrepasserror=false;
      }
      return null;
    }
  }

  String? validaterepassword(value) {
    if (value!.isEmpty) {
        repasswordErrorText = 'Please Retype Password';
        isrepasserror = true;
      return 'Please Retype Password';
    }
    else{
      if (value.length! < 8){
          repasswordErrorText='Enter Password more than 8 Character';
          isrepasserror=true;
        return 'Enter Password more than 8 Character';
      }
      else if (value != passwordController.text) {
          repasswordErrorText = 'Password is not matching';
          isrepasserror = true;
        return 'Please Match your password';
      }
      else
     {
          repasswordErrorText = '';
          isrepasserror = false;
          ispasserror=false;
        }
    }
  }
}