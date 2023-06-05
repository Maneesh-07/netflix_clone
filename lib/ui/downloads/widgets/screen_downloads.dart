import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/domain/toprated/toprated_api.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';

 List<ResultsTvshows> tvShowList = [];

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
 

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    gettvshows1();
  }

  Future<void> gettvshows1() async {
    tvShowList = await Apihandler2.fetchTvShowsMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Downloads",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          if (tvShowList.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator())),
              ],
            );
          }
          return Column(
            children: [
              kHeight,
              const _SmartDownloads(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Introducing Downloads For You",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                "We Will Download a Personalised Selection of\nMovies And Shows For you, so there's\nAlways something to watch on your\ndevice",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              kHeight,
              SizedBox(
                height: size.width,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: size.width * 0.37,
                    ),
                    DownloadsImagewidget(
                      margin: const EdgeInsets.only(
                        left: 170,
                        top: 30,
                      ),
                      angle: 25,
                      size: Size(size.width * 0.35, size.width * 0.55),
                      posterPath: tvShowList[0].posterPath ?? "null",
                    ),
                    DownloadsImagewidget(
                      margin: const EdgeInsets.only(
                        right: 170,
                        top: 30,
                      ),
                      angle: -20,
                      size: Size(size.width * 0.35, size.width * 0.55),
                      posterPath: tvShowList[1].posterPath ?? "null",
                    ),
                    DownloadsImagewidget(
                      radius: 5,
                      margin: const EdgeInsets.only(
                        left: 0,
                        top: 30,
                      ),
                      size: Size(size.width * 0.4, size.width * 0.6),
                      posterPath: tvShowList[2].posterPath ?? "null",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: kButtonColorBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Set up",
                      style: TextStyle(
                        color: kButtonColorWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              kHeight,
              MaterialButton(
                color: kButtonColorWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                child: const Text(
                  "See What You Can Download",
                  style: TextStyle(
                    color: kColorBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class Section2 extends StatelessWidget {
//   Section2({super.key});

//   final List<String> imageList = [
//     'assets/images/download_image.jpg',
//     'assets/images/download_image2.jpg',
//     'assets/images/download_image3.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class Section3 extends StatelessWidget {
//   const Section3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        const Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          "Smart Downloads",
          style: ktextTitle,
        )
      ],
    );
  }
}

class DownloadsImagewidget extends StatefulWidget {
  const DownloadsImagewidget({
    super.key,
    this.angle = 0,
    // required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
    required this.posterPath,
  });

  final String posterPath;

  final double angle;
  // final String imageList;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  State<DownloadsImagewidget> createState() => _DownloadsImagewidgetState();
}

class _DownloadsImagewidgetState extends State<DownloadsImagewidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Transform.rotate(
        angle: widget.angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500' + widget.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
