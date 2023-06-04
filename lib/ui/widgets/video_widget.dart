import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';
import 'package:netflix/ui/new_and_hot/screen_new_and_hot.dart';

class VideoWidget extends StatefulWidget {
  final String posterPath;
  const VideoWidget({
    super.key,
    required this.posterPath,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500' + widget.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
