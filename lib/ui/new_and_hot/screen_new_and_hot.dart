import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/domain/everyone/everyone_api.dart';
import 'package:netflix/domain/everyone/everyone_model.dart';
import 'package:netflix/domain/hot_coming_soon/coming_soon.dart';
import 'package:netflix/domain/hot_coming_soon/comingsoonapi.dart';
import 'package:netflix/ui/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix/ui/new_and_hot/widgets/everynes_watching_widget.dart';

List<Resultscoming> comingSoonList = [];
List<ResultsEveryone> everyOneList = [];

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEveryone();
    getComing();
  }

  Future<void> getComing() async {
    comingSoonList = await ApihandlerForComingSoon.fetchComingSoonMovies();
    setState(() {});
  }

  Future<void> getEveryone() async {
    everyOneList = await ApihandlerForEveryone.fetchEveryOneMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: kColorBlack,
            automaticallyImplyLeading: false,
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 25,
              ),
              kWidth,
              Container(
                width: 30,
                // height: 1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Avatar-Profile-Vector-Transparent.png'))),
              ),
              kWidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                labelColor: kColorBlack,
                unselectedLabelColor: kWhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: borderRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿 Comming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildCommingSoon(context),
          _buildEveryonesWatching(context),
        ]),
      ),
    );
  }

  _buildTAbBarView(String name) {
    return Center(
      child: Text(name),
    );
  }

  Widget _buildEveryonesWatching(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => EveryonesWatchingWidget(
          index: index, posterPath: everyOneList[index].posterPath ?? "null"),
      itemCount: everyOneList.length,
    );
  }

  Widget _buildCommingSoon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => CommingSoonWidget(
          posterPath: comingSoonList[index].posterPath ?? 'may be null',
          index: index,
        ),
        itemCount: comingSoonList.length,
      ),
    );
  }
}
