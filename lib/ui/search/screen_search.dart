import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/domain/toprated/toprated_api.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';
import 'package:netflix/ui/search/widgets/search_idle.dart';
import 'package:netflix/ui/search/widgets/search_result.dart';

import '../../domain/search/search_api.dart';
import '../../domain/search/search_model.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<ResultsTvshows> tvShowList = [];
  List<ResultsSearch> searchList = [];

  TextEditingController searchController = TextEditingController();
  bool isSearchidle = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettvshows();
    _getSearch();
    searchController.addListener(onSearchTextControlled);
  }

  Future<void> gettvshows() async {
    tvShowList = await Apihandler2.fetchTvShowsMovies();
    setState(() {});
  }

  _getSearch() async {
    searchList = await ApihandlerForSearch.fetchSearchMovies(
        searchController.text.trim());
    setState(() {});
  }

  void onSearchTextControlled() {
    _getSearch();
    setState(() {
      isSearchidle = searchController.text.isEmpty;
      print(isSearchidle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchController,
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              Expanded(
                child: isSearchidle
                    ? SearchIdleWidget(
                        tvShowList: tvShowList,
                      )
                    : SearchResult(
                        searchResultFrom: searchList,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
