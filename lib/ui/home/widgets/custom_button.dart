import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(fontSize: textSize, color: kWhiteColor),
        )
      ],
    );
  }
}
