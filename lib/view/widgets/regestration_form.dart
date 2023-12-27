import 'package:authentication_app/provider/reigistration_provider.dart';
import 'package:authentication_app/utils/device/device_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class RegistrationForm extends StatelessWidget {
  final dynamic  nameOfController;
  final dynamic yourFieldText;
  final dynamic focusNode;
  final dynamic nextFocusNode;
  final dynamic onchanged;
  const RegistrationForm({super.key, required this.yourFieldText,required this.focusNode,this.nextFocusNode,
   required this.nameOfController,required this.onchanged});

  @override
  Widget build(BuildContext context) {
    final rp=Provider.of<RegistrationProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          left: SDeviceUtlis.getScreenWidth(context)*.009, right: SDeviceUtlis.getScreenWidth(context)*.010),
      child: Container(
        height: SDeviceUtlis.getScreenHeight(context)*.048,
        decoration: BoxDecoration(

          border: Border.all(
            color: rp.isFirstNameError
                ? Colors.red
                : Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(10)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 2,
                            color: rp.isFirstNameError
                                ? Colors.red
                                : Colors
                                .blueAccent)),
                  ),
                  child: Center(
                    child: Text(
                      '$yourFieldText'.tr().toString(),
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: SDeviceUtlis.getScreenHeight(context)*.016,
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: focusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        45),
                  ],
                  onChanged: onchanged,
                  autovalidateMode:
                  AutovalidateMode
                      .onUserInteraction,
                  controller:nameOfController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
