import 'package:flutter/material.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/domain/models/popular/popularmodel.dart';

class TopRatedScreen extends StatelessWidget {
  // final List toprated;
  final List<Results> popularList;

  const TopRatedScreen({super.key, required this.popularList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Movies",
            style: ktextHome,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => Description(
                    //       name: popularList[index]['title'].toString(),
                    //       description: popularList[index]['overview'],
                    //       bannerurl: 'https://image.tmdb.org/t/p/w500' +
                    //           toprated[index]['backdrop_path'],
                    //       posturl: 'https://image.tmdb.org/t/p/w500' +
                    //           toprated[index]['poster_path'],
                    //       vote: toprated[index]['vote_average'].toString(),
                    //       launch_on: toprated[index]['release_date']),
                    // ));
                  },
                  child: popularList[index].title != null
                      ? Container(
                          width: 140,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/${popularList[index].posterPath}',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  popularList[index].title ?? 'Loading...',
                                  style: ktextTitle,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}





