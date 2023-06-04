import 'package:flutter/material.dart';
import 'package:netflix/Core/Color/Colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundcolor,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: Color.fromARGB(255, 199, 199, 199)),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.collections,
                ),
                label: 'New & Hot',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.emoji_emotions_outlined,
              //   ),
              //   label: 'Fast Laugh',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.search,
              //   ),
              //   label: 'Search',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                ),
                label: 'Downloads',
              ),
            ]);
      },
    );
  }
}
