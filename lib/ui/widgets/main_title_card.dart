import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/trending/trending_models.dart';
import 'package:netflix/ui/widgets/main_card.dart';
import 'package:netflix/ui/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<Resultstrending> trendingList;
  const MainTitleCard({
    super.key,
    required this.title, required this.trendingList,
    
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 180,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  MainCardWidget(posterPath: trendingList[index].posterPath??"null"),
              separatorBuilder: (context, index) => kWidth,
              itemCount: trendingList.length),
        ),
      ],
    );
  }
}
