import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexTextImageTemplate extends StatelessWidget {
  const ComplexTextImageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: context.sHeight,
                    width: context.sWidth,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: context.sWidth / 1.3,
                            height: context.sHeight / 1.3,
                            child: Stack(
                              children: [
                                const NormalNetworkImage(
                                    fit: BoxFit.cover,
                                    source:
                                        "https://wallpapers.com/images/hd/4k-architecture-yellow-glass-building-6d7nbmyltxlyxxv8.jpg"),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: context.sWidth / 1.3,
                                    height: context.sHeight / 1.3,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          context.toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR),
                                          context
                                              .toColor(APPLICATION_COLOR
                                                  .BACKGROUND_COLOR)
                                              .withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          right: 0,
                          child: SizedBox(
                            height: 150,
                            width: context.sWidth / 2,
                            child: Container(
                              color: context
                                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                              child: ListView.builder(
                                  itemCount: 59,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 150 * 1.7777,
                                      height: 150,
                                      margin: context.largeSpacerOnlyRight,
                                      child: const NormalNetworkImage(
                                          source:
                                              "https://wallpapercave.com/wp/wp2752752.jpg"),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          left: context.sWidth / 2,
                          child: Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  context.toColor(
                                      APPLICATION_COLOR.BACKGROUND_COLOR),
                                  context
                                      .toColor(
                                          APPLICATION_COLOR.BACKGROUND_COLOR)
                                      .withAlpha(100),
                                  context
                                      .toColor(
                                          APPLICATION_COLOR.BACKGROUND_COLOR)
                                      .withOpacity(0)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: context.xlargeSpacerOnlyLeft,
                    width: context.sWidth / 2.5,
                    height: context.sHeight,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(
                          text: "Sauna",
                          fontSize: FONT_SIZE.DISPLAY_LARGE,
                        ),
                        LabelText(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel quam rutrum, pharetra neque nec, scelerisque mauris. Maecenas semper egestas hendrerit. Morbi rhoncus neque eu risus efficitur ornare. Nunc efficitur odio at dictum dictum. Sed id feugiat massa. In euismod sollicitudin libero in ultricies.",
                          fontSize: FONT_SIZE.TITLE_LARGE,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(context.veryLargeSpacerOnlyBottom.bottom)
          ],
        ),
      ),
    );
  }
}
