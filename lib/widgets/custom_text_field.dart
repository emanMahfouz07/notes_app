import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.oldText})
      : super(key: key);
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? oldText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: oldText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: Get.isDarkMode ? kPrimaryColor : kPrimaryLightColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? kPrimaryColor : kPrimaryLightColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder:
            buildBorder(Get.isDarkMode ? kPrimaryColor : kPrimaryLightColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
          color: Get.isDarkMode ? kPrimaryColor : kPrimaryLightColor),
    );
  }
}
