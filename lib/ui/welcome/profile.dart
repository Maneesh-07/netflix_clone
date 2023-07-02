import 'package:flutter/material.dart';

import 'package:netflix/ui/main_page/widgets/main_page.dart';

class ProfileSelecting extends StatelessWidget {
  const ProfileSelecting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarWidget(
            title: '',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Who's Watching?",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenMainPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/Avatar-Profile-Vector-Transparent.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/pngegg-baby.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // Aligns the text to the right
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 35),
                  child: Text(
                    'Person',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 65),
                  child: Text(
                    'Buddy',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 120),
            child: Text(
              'Add profile',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key, required String title});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 0, left: 30),
        child: Center(
          child: Image.asset(
            "assets/images/netflix-transparent.png",
            scale: 4,
          ),
        ),
      ),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 15,
          ),
          child: Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}
