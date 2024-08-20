import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_six/project_template_six_entity.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class RowWidget extends StatelessWidget {
  final List<ProjectHomeEntity> home;
  final bool isFullView;

  const RowWidget({required this.home, required this.isFullView, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
      ),
      child: Column(
        children: [
          Row(
            children: [
              !isFullView
                  ? const Icon(Icons.arrow_drop_down)
                  : const Icon(Icons.arrow_drop_up),
              Gap(context.largeSpacerSize),
              Flexible(
                  child: LabelText(
                      text:
                          " ${GeneralConstant.FIELD_NAME['Floor']}: ${home.first.floor}")),
              Gap(context.largeSpacerSize),
              CircleAvatar(
                maxRadius: 14,
                backgroundColor:
                    context.toColor(APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR),
                child: LabelText(
                  text:
                      "${home.where((element) => element.saleState == HOME_STATE.ON_SALE).length}",
                  textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                  fontSize: FONT_SIZE.LABEL_SMALL,
                ),
              ),
            ],
          ),
          isFullView
              ? Column(
                  children: [
                    Gap(context.largeSpacerSize),
                    Padding(
                      padding: context.midSpacerOnlyHorizontal,
                      child: Column(
                        children: [
                          Container(
                            height: .3,
                            color: context
                                .toColor(
                                    APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                .withAlpha(150),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                        text:
                                            "${GeneralConstant.FIELD_NAME['Number']}"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                        text:
                                            "${GeneralConstant.FIELD_NAME['Area']}"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                        text:
                                            "${GeneralConstant.FIELD_NAME['Price']}"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                      text:
                                          "${GeneralConstant.FIELD_NAME['HomeType']}",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                      maxLines: 1,
                                      text:
                                          "${GeneralConstant.FIELD_NAME['RoomSize']}",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: Center(
                                    child: LabelText(
                                        text:
                                            "${GeneralConstant.FIELD_NAME['SaleState']}"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                            ],
                          ),
                          Container(
                            height: .3,
                            color: context
                                .toColor(
                                    APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                .withAlpha(150),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: context.midSpacerOnlyHorizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: home.length,
                      itemBuilder: ((c, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: LabelText(
                                              text: home[index].number)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          home[index].imageGalleries.isNotEmpty
                                              ? GestureDetector(
                                                  onTap: () => context
                                                          .pushNamed(
                                                              NavigationConstant
                                                                  .GALLERY,
                                                              extra: {
                                                            "gallery": home[
                                                                    index]
                                                                .imageGalleries,
                                                            "isExperiance":
                                                                false,
                                                            "selectedIndex": 0
                                                          }),
                                                  child: Icon(Icons.image))
                                              : const SizedBox.shrink(),
                                          home[index].imageGalleries.isNotEmpty
                                              ? Gap(context.midSpacerSize)
                                              : const SizedBox.shrink(),
                                          home[index].videoGalleries.isNotEmpty
                                              ? GestureDetector(
                                                  onTap: () => context
                                                      .pushNamed(
                                                          NavigationConstant
                                                              .GALLERY,
                                                          extra: {
                                                        "gallery": home[index]
                                                            .videoGalleries,
                                                        "isExperiance": false,
                                                        "selectedIndex": 0
                                                      }),
                                                  child: Icon(Icons
                                                      .video_collection_sharp),
                                                )
                                              : const SizedBox.shrink(),
                                          home[index].videoGalleries.isNotEmpty
                                              ? Gap(context.midSpacerSize)
                                              : const SizedBox.shrink(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                    child: Center(
                                        child:
                                            LabelText(text: home[index].area))),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                    child: Center(
                                        child: LabelText(
                                            text: home[index].price))),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                    child: Center(
                                        child: LabelText(
                                            text: home[index].homeType))),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                    child: Center(
                                        child: LabelText(
                                            text: home[index].roomSize))),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                Expanded(
                                    child: Container(
                                  height: 50,
                                  color: getColorFromState(
                                      context, home[index].saleState),
                                  child: Center(
                                      child: LabelText(
                                    text: getTextFromState(
                                        context, home[index].saleState),
                                    textColor: APPLICATION_COLOR.LIGHT,
                                  )),
                                )),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                              ],
                            ),
                            Container(
                              height: .3,
                              color: context
                                  .toColor(
                                      APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                  .withAlpha(150),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Color getColorFromState(BuildContext context, HOME_STATE state) {
    return switch (state) {
      HOME_STATE.RESERVED => context.toColor(APPLICATION_COLOR.BLUE),
      HOME_STATE.ON_SALE => context.toColor(APPLICATION_COLOR.GREEN),
      HOME_STATE.SOLD => context.toColor(APPLICATION_COLOR.RED)
    };
  }

  String getTextFromState(BuildContext context, HOME_STATE state) {
    return switch (state) {
      HOME_STATE.RESERVED => GeneralConstant.FIELD_NAME['RESERVED'],
      HOME_STATE.ON_SALE => GeneralConstant.FIELD_NAME['ON_SALE'],
      HOME_STATE.SOLD => GeneralConstant.FIELD_NAME['SOLD']
    };
  }
}
