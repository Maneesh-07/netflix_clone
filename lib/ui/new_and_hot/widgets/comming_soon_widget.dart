import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Core/Color/colors.dart';
import 'package:netflix/ui/home/widgets/custom_button.dart';
import 'package:netflix/ui/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/ui/widgets/video_widget.dart';
import '../../../Core/constants.dart';

class CommingSoonWidget extends StatefulWidget {
  final String posterPath;
  CommingSoonWidget({
    super.key,
    required this.posterPath,
    required this.index,
  });
  int index;
  @override
  State<CommingSoonWidget> createState() => _CommingSoonWidgetState();
}

class _CommingSoonWidgetState extends State<CommingSoonWidget> {
  @override
  Widget build(BuildContext context) {
    String formattedMonth = DateFormat.MMM()
        .format(DateTime.parse(comingSoonList[widget.index].releaseDate ?? ''));
    String formattedDay = DateFormat.d()
        .format(DateTime.parse(comingSoonList[widget.index].releaseDate ?? ''));
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                formattedMonth,
                style: const TextStyle(
                    color: colorGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                formattedDay,
                style: const TextStyle(
                    letterSpacing: 4,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                posterPath: widget.posterPath,
              ),
              kHeight,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      '${comingSoonList[widget.index].title}',
                      style: const TextStyle(
                          letterSpacing: -1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width70,
                  const Row(
                    children: [
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
              // const Text('Coming on Friday'),
              kHeight,
              // Text(
              //   '${comingSoonList[widget.index].originalTitle}',
              //   style:
              //       const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              kHeight,
              Text(
                '${comingSoonList[widget.index].overview}',
                style: const TextStyle(color: colorGrey),
              ),
              kHeight,
            ],
          ),
        ),
      ],
    );
  }
}
