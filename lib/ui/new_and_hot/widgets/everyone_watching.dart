import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/ui/home/widgets/custom_button.dart';
import 'package:netflix/ui/widgets/video_widget.dart';



class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  return  const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
      kHeight,
        Text(
      'Friends',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    ),
    kHeight,
     Text(
      "Landing the lead in the school musical is a dream come true for jodi, until the pressure sesnds her confidence-and her relationship-into a tailspin",
      style: TextStyle(
        color: colorGrey
      ),
    ),
    height50,
     VideoWidget(),
    kHeight,
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
        icon: (Icons.send), 
        title: 'Share',
        iconSize: 25,
        textSize: 16,
        ),
        kWidth,
        CustomButton(
        icon: (Icons.add), 
        title: 'My List',
        iconSize: 25,
        textSize: 16,
        ),
        kWidth,
         CustomButton(
        icon: (Icons.play_arrow), 
        title: 'Play',
        iconSize: 25,
        textSize: 16,
        ),
        kWidth,
        kWidth,
        kHeight
      ],
    )
    ],
  );
}
}