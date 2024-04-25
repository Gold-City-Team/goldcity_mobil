import 'package:flutter/material.dart';

class VideoPlayerSelfController extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;
  const VideoPlayerSelfController(
      {required this.isPlaying, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: () => onTap(),
        child: CircleAvatar(
          maxRadius: 28,
          child: isPlaying
              ? const Icon(
                  Icons.pause,
                )
              : const Icon(
                  Icons.play_arrow,
                ),
        ),
      ),
    );
  }
}
