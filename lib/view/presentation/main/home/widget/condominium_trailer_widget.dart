import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:video_player/video_player.dart';

class CondominiumTrailerWidget extends StatefulWidget {
  final ComplexEntity complexEntity;
  final VoidCallback onExploreTap;
  const CondominiumTrailerWidget(
      {required this.complexEntity, required this.onExploreTap, super.key});

  @override
  State<CondominiumTrailerWidget> createState() =>
      _CondominiumTrailerWidgetState();
}

class _CondominiumTrailerWidgetState extends State<CondominiumTrailerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.complexEntity.complexDetail.mainImage.url));
    _controller.setLooping(true);
    _controller.initialize().then((value) => {setState(() {})});
    _controller.play();
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sWidth,
      height: context.sHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: context.sWidth,
              height: context.sHeight,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width:
                              context.sHeight * _controller.value.aspectRatio,
                          height: context.sHeight * 1,
                          child: VideoPlayer(_controller)),
                    ),
                  ),
                  Container(
                    height: context.sWidth,
                    width: (context.sWidth / 5) * 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                          context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                              .withAlpha(200),
                          context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                              .withAlpha(100),
                          context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                              .withAlpha(0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: context.xlargeSpacerOnlyHorizontal,
            child: SizedBox(
              width: context.sWidth / 2,
              height: context.sHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.sWidth / 4,
                    child: NormalNetworkImage(
                        source: widget.complexEntity.complexDetail.logo.url),
                  ),
                  Gap(context.midSpacerSize),
                  LabelText(
                    text: widget.complexEntity.complexDetail.title,
                    fontSize: FONT_SIZE.DISPLAY_LARGE,
                  ),
                  Gap(context.midSpacerSize),
                  const LabelText(
                    text: "Lorem ipsum dolor sit amet.Lorem ipsum",
                    fontSize: FONT_SIZE.TITLE_LARGE,
                  ),
                  Gap(context.largeSpacerSize),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => widget.onExploreTap(),
              child: Container(
                width: context.sWidth / 4 - 10,
                height: 60,
                margin: context.xLargeSpacerOnlyBottom,
                decoration: BoxDecoration(
                  color: context.toColor(APPLICATION_COLOR.DARK).withAlpha(200),
                ),
                padding: context.largeSpacerOnlyHorizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                      text: LocaleKeys.explore.tr(),
                      fontSize: FONT_SIZE.TITLE_LARGE,
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined, size: 36)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
