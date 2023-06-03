import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix/ui/welcome/profile.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProfileSelecting(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/netflix-transparent.png',
                color: Color.fromARGB(247, 254, 7, 7),
                width: 270,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 40,
              height: 40,
              // child: CircularProgressIndicator(
              //   strokeWidth: 4,
              //   color: Color.fromARGB(255, 232, 15, 0),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
