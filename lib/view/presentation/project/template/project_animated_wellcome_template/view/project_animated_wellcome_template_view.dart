import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectAnimatedWelcomeTemplateView extends StatelessWidget {
  final String url;
  const ProjectAnimatedWelcomeTemplateView({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sWidth,
      height: context.sHeight,
      child: Stack(
        children: [
          SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: NormalNetworkImage(
              source: url,
            ),
          ),
          Container(
            color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
            width: context.sWidth,
            height: context.sHeight,
          ).animate(delay: const Duration(milliseconds: 100)).slideX(
              begin: 0.2,
              end: 1,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic),
          SizedBox(
            width: context.sWidth / 2,
            height: context.sHeight,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(170),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(120),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(0),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate(delay: const Duration(milliseconds: 1500))
              .fade(duration: const Duration(milliseconds: 1500)),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.sWidth / 4,
                  child: const NormalNetworkImage(
                    fit: BoxFit.contain,
                    source:
                        "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/398cf2c8-a393-48b4-ad4d-54e0867510bf.webp",
                  ),
                )
                    .animate(delay: const Duration(milliseconds: 1500))
                    .fade(duration: const Duration(milliseconds: 1500))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
