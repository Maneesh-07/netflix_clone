import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Infrastructure/api_keys.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/models/popular/popular.dart';
import 'package:netflix/domain/models/popular/popularmodel.dart';
import 'package:netflix/domain/toprated/toprated_api.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';
import 'package:netflix/domain/trending/trending_api.dart';
import 'package:netflix/domain/trending/trending_models.dart';
import 'package:netflix/ui/home/widgets/background_card_widget.dart';
import 'package:netflix/ui/home/widgets/number_title_card.dart';
import 'package:netflix/ui/home/widgets/toprated_list.dart';
import 'package:netflix/ui/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Results> popularList = [];

  List<Resultstrending> trendingList = [];

  List<ResultsTvshows> tvShowList = [];

  @override
  void initState() {
    // TODO: implement initState
    getpopular();
    gettrending();
    gettvshows();
    super.initState();
  }

  Future<void> getpopular() async {
    popularList = await Apihandler.fetchPopularMovies();
  }

  Future<void> gettrending() async {
    trendingList = await Apihandler1.fetchTrendingMovies();
  }

  Future<void> gettvshows() async {
    tvShowList = await Apihandler2.fetchTvShowsMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      BackgroundCard(
                        posterPath: trendingList[index].posterPath ?? "null",
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "Trending Movies",
                        trendingList: trendingList,
                      ),
                      kHeight,
                      // MainTitleCard(
                      //   title: "Trending Now",
                      //   movielist: tvShows,
                      // ),
                      NumberTitleCard(
                        tvShowList: tvShowList,
                      ),
                      TopRatedScreen(
                        popularList: popularList,
                      ),
                      // kHeight,

                      // kHeight,
                      // const MainTitleCard(
                      //   title: "Tense Dramas",
                      // ),
                      // kHeight,
                      // const MainTitleCard(
                      //   title: "South Indian Cinema",
                      // ),
                      kHeight,
                    ],
                  );
                },
                // children: [

                // ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.1),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/N-logo.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kWidth,
                              Container(
                                color: Colors.blue,
                                height: 30,
                                width: 30,
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tv Shows',
                                style: ktextHome,
                              ),
                              Text(
                                "Movies",
                                style: ktextHome,
                              ),
                              Text(
                                "Categories",
                                style: ktextHome,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
