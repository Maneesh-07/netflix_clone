import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';
import 'package:netflix/ui/home/widgets/number_card.dart';
import 'package:netflix/ui/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<ResultsTvshows> tvShowList;

  const NumberTitleCard({
    super.key,
    required this.tvShowList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top 10 TV shows in India Today",
        ),
        kHeight,
        LimitedBox(
          maxHeight: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NumberCard(
                    index: index,
                    posterpath: tvShowList[index].posterPath ?? "null",
                  ),
              itemCount: tvShowList.length),
        ),
      ],
    );
  }
}
