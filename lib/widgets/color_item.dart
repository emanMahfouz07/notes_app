import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.color,
    required this.isActive,
  }) : super(key: key);
  final int color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: isActive
          ? CircleAvatar(
              radius: 32,
              backgroundColor:
                  Get.isDarkMode ? Colors.white : kPrimaryLightColor,
              child: CircleAvatar(
                backgroundColor: Color(color),
                radius: 28,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            )
          : CircleAvatar(
              backgroundColor: Color(color),
              radius: 34,
            ),
    );
  }
}
