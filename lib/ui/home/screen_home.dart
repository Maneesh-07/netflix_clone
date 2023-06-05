import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Core/Color/colors.dart';
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
import 'package:netflix/ui/search/screen_search.dart';
import 'package:netflix/ui/widgets/main_title_card.dart';

List<Results> popularList = [];

List<Resultstrending> trendingList = [];

List<ResultsTvshows> tvShowList = [];

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getpopular();
    gettrending();
    gettvshows();
  }

  Future<void> getpopular() async {
    popularList = await Apihandler.fetchPopularMovies();
    setState(() {});
  }

  Future<void> gettrending() async {
    trendingList = await Apihandler1.fetchTrendingMovies();
    setState(() {});
  }

  Future<void> gettvshows() async {
    tvShowList = await Apihandler2.fetchTvShowsMovies();
    setState(() {});
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  if (trendingList.isEmpty) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator())),
                      ],
                    ); // Return an empty container or a placeholder widget
                  }

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
                      NumberTitleCard(
                        tvShowList: tvShowList,
                      ),
                      TopRatedScreen(
                        popularList: popularList,
                      ),
                      kHeight,
                    ],
                  );
                },
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScreenSearch(),
                                  ));
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              kWidth,
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: kColorBlack,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Avatar-Profile-Vector-Transparent.png'),
                                        fit: BoxFit.cover)),
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
