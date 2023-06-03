import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/ui/widgets/sized_box_widget.dart';

class NumberCard extends StatefulWidget {
  const NumberCard({super.key, required this.index, required this.posterpath});
  final int index;
  final String posterpath;

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            szdBox(180, 40),
            Container(
              width: 130,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/' +
                              widget.posterpath),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          bottom: -20,
          left: 4,
          child: BorderedText(
            strokeWidth: 8.0,
            strokeColor: Colors.white,
            child: Text(
              "${widget.index + 1}",
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: kColorBlack,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
