import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedValue;
  final dynamic onChanged;
  final bool isError;

  CustomDropdown({
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.048,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isError ? Colors.red : Colors.blue,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                      color: isError ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    label.tr().toString(),
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.018),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.016,
                            ),
                          ),
                        ))
                            .toList(),
                        value: selectedValue,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}