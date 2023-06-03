import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/colors.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posturl, launch_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posturl,
      // required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlack,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    child: Text(
                      ' ⭐ Average Rating -' ,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              name != null ? name : 'Not Loaded',
              style:
                  TextStyle(color: kWhiteColor, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Relaseing On -$launch_on',
              style:
                  const TextStyle(color: kWhiteColor, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posturl),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
