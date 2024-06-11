import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class BackgroundWidget extends StatelessWidget {
  final String backgroundImage;
  const BackgroundWidget({required this.backgroundImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: context.sWidth / 2 - 100,
          child: SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child:
                NormalNetworkImage(source: backgroundImage, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: context.sWidth / 2 + 100,
            height: context.sHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                    Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
      ],
    );
  }
}
