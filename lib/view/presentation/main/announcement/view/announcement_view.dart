import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/announcement/view_model/announcement_view_model.dart';
import 'package:goldcity/view/presentation/main/announcement/widget/file_icon_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AnnouncementViewModel>(
      viewModel: AnnouncementViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AnnouncementViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget phoneView(BuildContext context, AnnouncementViewModel value) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.midSpacerSize),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () =>
                    value.showDetail ? value.toggleShowDetail() : context.pop(),
                child: Container(
                  width: 50,
                  height: 50,
                  margin: context.midSpacerOnlyLeft,
                  decoration: BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.GOLD),
                      borderRadius: context.midRadius),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
            Gap(context.midSpacerSize),
            value.showDetail
                ? Expanded(
                    child: Container(
                      padding: context.midSpacer,
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              LabelText(
                                text: value.detail!.title,
                                fontSize: FONT_SIZE.HEADLINE_LARGE,
                                fontWeight: FontWeight.bold,
                                textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                              ),
                              Gap(context.largeSpacerSize),
                              LabelText(
                                text: value.detail!.description,
                                textColor: APPLICATION_COLOR.SUBTITLE,
                                fontSize: FONT_SIZE.BODY_LARGE,
                              ),
                              Gap(context.largeSpacerSize),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                    itemCount: value.detail!.attachments.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () => launchUrl(Uri.parse(value
                                              .detail!
                                              .attachments[index]
                                              .file
                                              .url)),
                                          child: Container(
                                            margin: context.midSpacerOnlyRight,
                                            child: FileIconWidget(
                                                file: value.detail!
                                                    .attachments[index]),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Observer(builder: (context) {
                    if (value.entity == null) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        Container(
                          margin: context.midSpacerOnlyHorizontal,
                          height: 50,
                          width: context.sWidth,
                          child: RoundedTextField(
                            newText: (e) {
                              value.search(e);
                            },
                            hintText: "Ara...",
                          ),
                        ),
                        Gap(context.midSpacerSize),
                        SizedBox(
                          height: context.sHeight - 130,
                          child: ListView.builder(
                              padding: context.midSpacerOnlyHorizontal,
                              itemCount: value.entitySearch!.length,
                              itemBuilder: (context, index) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () => {
                                      value.toggleShowDetail(),
                                      value.changeSelectedIndex(
                                          value.entitySearch![index].id)
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: context.midSpacer,
                                          color: context
                                              .toColor(APPLICATION_COLOR
                                                  .EXTRA_CLOSE_BACKGROUND_COLOR)
                                              .withAlpha(50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              LabelText(
                                                text: value
                                                    .entitySearch![index].title,
                                                fontSize: FONT_SIZE.TITLE_LARGE,
                                                fontWeight: FontWeight.bold,
                                                textColor: APPLICATION_COLOR
                                                    .OPPOSITE_COLOR,
                                              ),
                                              Gap(context.largeSpacerSize),
                                              LabelText(
                                                text: value.entitySearch![index]
                                                    .description,
                                                maxLines: 2,
                                                textColor:
                                                    APPLICATION_COLOR.SUBTITLE,
                                                fontSize:
                                                    FONT_SIZE.LABEL_MEDIUM,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Gap(context.midSpacerSize),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  }),
          ],
        );
      }),
    );
  }

  Widget tabletView(BuildContext context, AnnouncementViewModel value) {
    return Container(
      margin: context.largeSpacerOnlyHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(context.largeSpacerSize),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                    borderRadius: context.midRadius),
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
          Gap(context.midSpacerSize),
          Gap(context.midSpacerSize),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Observer(builder: (context) {
                      if (value.entitySearch == null ||
                          value.selectedIndex == -1) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        children: [
                          Container(
                            margin: context.midSpacerOnlyRight,
                            height: 50,
                            child: RoundedTextField(
                              newText: (e) {
                                value.search(e);
                              },
                              hintText: "Ara...",
                            ),
                          ),
                          Gap(context.midSpacerSize),
                          Expanded(
                            child: ListView.builder(
                              itemCount: value.entitySearch!.length,
                              itemBuilder: (context, index) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () => value.changeSelectedIndex(
                                        value.entitySearch![index].id),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: context.midSpacer,
                                          margin: context.midSpacerOnlyRight,
                                          color: context
                                              .toColor(APPLICATION_COLOR
                                                  .EXTRA_CLOSE_BACKGROUND_COLOR)
                                              .withAlpha(value.selectedIndex ==
                                                      value.entitySearch![index]
                                                          .id
                                                  ? 255
                                                  : 50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              LabelText(
                                                text: value
                                                    .entitySearch![index].title,
                                                fontSize:
                                                    FONT_SIZE.TITLE_MEDIUM,
                                                fontWeight: FontWeight.bold,
                                                textColor: APPLICATION_COLOR
                                                    .OPPOSITE_COLOR,
                                              ),
                                              Gap(context.largeSpacerSize),
                                              LabelText(
                                                text: value.entitySearch![index]
                                                    .description,
                                                maxLines: 2,
                                                textColor:
                                                    APPLICATION_COLOR.SUBTITLE,
                                                fontSize:
                                                    FONT_SIZE.LABEL_MEDIUM,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Gap(context.largeSpacerSize),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Observer(builder: (context) {
                    if (value.detail == null || value.selectedIndex == -1) {
                      return const SizedBox.shrink();
                    }
                    return Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        padding: context.midSpacer,
                        color: context.toColor(
                            APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                        child: ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(
                                  text: value.detail!.title,
                                  fontSize: FONT_SIZE.HEADLINE_LARGE,
                                  fontWeight: FontWeight.bold,
                                  textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                                ),
                                Gap(context.largeSpacerSize),
                                LabelText(
                                  text: value.detail!.description,
                                  textLineHeight: 1.6,
                                  textColor: APPLICATION_COLOR.SUBTITLE,
                                  fontSize: FONT_SIZE.BODY_LARGE,
                                ),
                                Gap(context.largeSpacerSize),
                                SizedBox(
                                  height: 250,
                                  child: ListView.builder(
                                      itemCount:
                                          value.detail!.attachments.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () => launchUrl(Uri.parse(
                                                value.detail!.attachments[index]
                                                    .file.url)),
                                            child: Container(
                                              margin:
                                                  context.midSpacerOnlyRight,
                                              child: FileIconWidget(
                                                  file: value.detail!
                                                      .attachments[index]),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
