import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

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
          backgroundColor: context.toColor(APPLICATION_COLOR.LIGHT),
          maxRadius: 28,
          child: isPlaying
              ? Icon(
                  color: context.toColor(APPLICATION_COLOR.GOLD),
                  Icons.pause,
                )
              : Icon(
                  color: context.toColor(APPLICATION_COLOR.GOLD),
                  Icons.play_arrow,
                ),
        ),
      ),
    );
  }
}
