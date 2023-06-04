import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/ui/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/ui/widgets/sized_box_widget.dart';
import 'package:netflix/ui/widgets/video_widget.dart';

import '../../home/widgets/custom_button.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;

  EveryonesWatchingWidget({
    super.key,
    required this.index,
    required this.posterPath,
  });

  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            everyOneList[index].title.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          SizedBox(
            child: Text(
              everyOneList[index].overview.toString(),
              style: const TextStyle(color: colorGrey),
            ),
          ),
          szdBox(50, 0),
          VideoWidget(posterPath: everyOneList[index].posterPath ?? "null"),
          kHeight,
          const Row(
            children: [
              // Image.network(
              //   movieTitleImage,
              //   height: 50,
              // ),
              Spacer(),
              CustomButton(
                icon: Icons.send,
                title: "Share",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              CustomButton(
                icon: Icons.add,
                title: "My List",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              CustomButton(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}
