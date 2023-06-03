import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/ui/home/widgets/custom_button.dart';
import 'package:netflix/ui/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        SizedBox(
          child: Column(
            children: [
              Text(
                'Feb',
                style: TextStyle(
                    color: colorGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '11',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoWidget(),
            kHeight,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TALL GIRL 2',
                  style: TextStyle(
                      letterSpacing: -3,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                width70,
                Row(
                  children:  [
                    CustomButton(
                      icon: (Icons.notifications_none),
                      title: 'Remind me',
                      iconSize: 20,
                      textSize: 12,
                    ),
                    kWidth,
                    CustomButton(
                      icon: (Icons.info),
                      title: 'Info',
                      iconSize: 20,
                      textSize: 12,
                    ),
                    kWidth
                  ],
                )
              ],
            ),
            kHeight,
            Text('Coming on Friday'),
            kHeight,
            Text(
              'TALL GIRL 2',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            kHeight,
            Text(
              "Landing the lead in the school musical is a\ndream come true for jodi, until the pressure\nsesnds her confidence-and her relationship-\ninto a tailspin",
              style: TextStyle(color: colorGrey),
            ),
            kHeight,
          ],
        ),
      ],
    );
  }
}
