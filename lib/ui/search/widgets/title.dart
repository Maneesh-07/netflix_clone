import 'package:flutter/material.dart';

class TitleSearchPage extends StatelessWidget {
  const TitleSearchPage({
    required this.title,
    super.key,
  });

final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
