import 'package:flutter/material.dart';
import 'package:netflix/ui/fast_laugh/widgets/video_list.dart';

class ScreenFastandLaugh extends StatelessWidget {
  const ScreenFastandLaugh({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index){
            return VideoListItem(index: index);
          }
        ),
      ),
    ),
  );
 }
}