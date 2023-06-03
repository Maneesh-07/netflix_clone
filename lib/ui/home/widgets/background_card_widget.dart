import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';
import 'package:netflix/ui/home/widgets/custom_button.dart';

class BackgroundCard extends StatefulWidget {
  final String posterPath;

  const BackgroundCard({
    super.key,
    required this.posterPath,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500' + widget.posterPath),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(icon: Icons.add, title: "My List"),
                _playButton(),
                const CustomButton(icon: Icons.info_outline, title: "Info"),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            // minimumSize: MaterialStateProperty.all(Size(50, 20)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: kColorBlack,
        ),
        label: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 20, color: kColorBlack, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
