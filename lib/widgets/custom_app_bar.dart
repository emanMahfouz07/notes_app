import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/widgets/custom_search_Icon.dart';
import 'package:notes_app/widgets/notes_item.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool isDark = false;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.isDarkMode
                ? Get.changeTheme(ThemeData.light())
                : Get.changeTheme(ThemeData.dark());
            setState(() {});
          },
          icon:
              Icon(Get.isDarkMode ? Icons.nightlight_round_sharp : Icons.sunny),
        ),
        CustomSearchIcon(
          onPressed: widget.onPressed,
          icon: widget.icon,
        ),
      ],
    );
  }
}
