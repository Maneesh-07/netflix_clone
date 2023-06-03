import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';
import 'package:netflix/ui/downloads/widgets/screen_downloads.dart';
import 'package:netflix/ui/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/ui/home/screen_home.dart';
import 'package:netflix/ui/main_page/widgets/bottom_nav.dart';
import 'package:netflix/ui/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/ui/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastandLaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationScreen(),
    );
  }
}
