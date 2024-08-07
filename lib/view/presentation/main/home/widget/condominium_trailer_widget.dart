import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
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
    _controller = VideoPlayerController.asset("assets/video/trailer.mp4");
    _controller.setLooping(true);
    _controller.initialize().then((value) => {
          if (mounted) {setState(() {})}
        });
    _controller.play();
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return isTablet() ? tabletView() : phoneView();
  }

  Widget tabletView() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      width: (context.sHeight) * _controller.value.aspectRatio,
                      height: context.sHeight,
                      child: VideoPlayer(_controller)),
                ),
              ),
              Container(
                height: context.sWidth,
                width: (context.sWidth),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(100),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(0),
                      context
                          .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                          .withAlpha(0),
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
        Container(
          width: context.sWidth / 3,
          margin: context.xxlargeSpacerOnlyLeft,
          height: context.sHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: context.tr("wellcome"),
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: FONT_SIZE.DISPLAY_SMALL,
              ),
              LabelText(
                text: widget.complexEntity.slogan,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
              Gap(context.largeSpacerSize),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => widget.onExploreTap(),
              child: Container(
                width: context.sWidth / 4 - 10,
                height: 60,
                margin: context.xLargeSpacerOnlyBottom,
                decoration: BoxDecoration(
                  color: context
                      .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                      .withAlpha(235),
                ),
                padding: context.largeSpacerOnlyHorizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                      text: context.tr("explore"),
                      fontSize: FONT_SIZE.TITLE_LARGE,
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined, size: 36)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget phoneView() {
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
                    height: context.sHeight,
                    width: (context.sWidth),
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
          SafeArea(
            child: Padding(
              padding: context.largeSpacerOnlyLeft,
              child: SizedBox(
                width: context.sWidth,
                height: context.sHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    LabelText(
                      text: widget.complexEntity.title,
                      fontSize: FONT_SIZE.HEADLINE_LARGE,
                      textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                    ),
                    Gap(context.midSpacerSize),
                    LabelText(
                      text: widget.complexEntity.slogan,
                      textColor: APPLICATION_COLOR.SUBTITLE,
                      fontSize: FONT_SIZE.TITLE_SMALL,
                    ),
                    Gap(context.largeSpacerSize),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => widget.onExploreTap(),
                child: Container(
                  width: context.sWidth / 2,
                  height: 60,
                  margin: context.xLargeSpacerOnlyBottom,
                  decoration: BoxDecoration(
                    color: context
                        .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                        .withAlpha(200),
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
          ),
        ],
      ),
    );
  }
}
