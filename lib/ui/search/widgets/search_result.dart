import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/ui/search/widgets/title.dart';

// ignore: must_be_immutable
class SearchResult extends StatefulWidget {
  List searchResultFrom = [];
  SearchResult({super.key, required this.searchResultFrom});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSearchPage(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.4,
            crossAxisCount: 3,
            children: List.generate(
              widget.searchResultFrom.length,
              (index) => MovieCard(
                posterPath:
                    widget.searchResultFrom[index].posterPath.toString(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MovieCard extends StatefulWidget {
  final String posterPath;
  const MovieCard({super.key, required this.posterPath});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500' + widget.posterPath),
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
