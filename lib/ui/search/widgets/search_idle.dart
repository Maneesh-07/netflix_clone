import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';
import 'package:netflix/ui/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ekZobS8isE6mA53RAiGDG93hBxL.jpg';

class SearchIdleWidget extends StatelessWidget {
  final List<ResultsTvshows> tvShowList;
  const SearchIdleWidget({super.key, required this.tvShowList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSearchPage(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => TopSearchItemTile(
              posterPath: tvShowList[index].backdropPath ?? 'may be null',
              title: tvShowList[index].name ?? "",
            ),
            separatorBuilder: (ctx, index) => tileHeight,
            itemCount: tvShowList.length,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatefulWidget {
  final String posterPath;
  final String title;
  const TopSearchItemTile(
      {super.key, required this.posterPath, required this.title});

  @override
  State<TopSearchItemTile> createState() => _TopSearchItemTileState();
}

class _TopSearchItemTileState extends State<TopSearchItemTile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500' + widget.posterPath),
          )),
        ),
        kWidth,
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: Colors.white,
          size: 35,
        )
      ],
    );
  }
}
