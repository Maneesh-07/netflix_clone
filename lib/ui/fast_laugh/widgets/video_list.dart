import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    super.key,
    required this.index
    });

  @override
  Widget build(BuildContext context) {
    return Stack( 
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(
                        Icons.volume_mute,
                      ),
                    ),
                  ),
                ),
                // right side
                   Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:  NetworkImage( 'https://www.themoviedb.org/t/p/w220_and_h330_face/y2d2SBqK33mGOG2CqAYMo3YbWE4.jpg'),
                    ),
                    VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActions(icon: Icons.add, title: 'My List'),
                    VideoActions(icon: Icons.share, title: 'Share'),
                    VideoActions(icon: Icons.play_circle_fill, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final  IconData icon;

  final String title;
  const VideoActions({
    super.key,
    required this.icon,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
            ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            )
        ],
      ),
    );
  }
}