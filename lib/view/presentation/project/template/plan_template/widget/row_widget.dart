import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_six/project_template_six_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
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
              Expanded(
                  child: LabelText(
                      text: LocaleKeys.floor.tr(args: [home.first.floor]))),
              const Spacer(),
              CircleAvatar(
                maxRadius: 14,
                backgroundColor:
                    context.toColor(APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR),
                child: LabelText(
                  text:
                      "${home.where((element) => element.state == HOME_STATE.WAITING).length}",
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
                                        text: LocaleKeys.apartmentNumber.tr()),
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
                                  child: const Center(
                                    child: LabelText(text: "m²"),
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
                                    child:
                                        LabelText(text: LocaleKeys.price.tr()),
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
                                    child:
                                        LabelText(text: LocaleKeys.type.tr()),
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
                                    child:
                                        LabelText(text: LocaleKeys.state.tr()),
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
                                  child: Center(
                                    child: LabelText(text: home[index].no),
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
                                        child: LabelText(
                                            text: "${home[index].area} m²"))),
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
                                            text: "${home[index].price} €"))),
                                Container(
                                  width: .5,
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR
                                          .CLOSE_BACKGROUND_COLOR)
                                      .withAlpha(150),
                                ),
                                const Expanded(
                                    child: Center(
                                        child: LabelText(text: "Orta Daire"))),
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
                                      context, home[index].state),
                                  child: Center(
                                      child: LabelText(
                                    text: getTextFromState(
                                        context, home[index].state),
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
      HOME_STATE.WAITING => context.toColor(APPLICATION_COLOR.GREEN),
      HOME_STATE.SELLED => context.toColor(APPLICATION_COLOR.RED)
    };
  }

  String getTextFromState(BuildContext context, HOME_STATE state) {
    return switch (state) {
      HOME_STATE.RESERVED => LocaleKeys.reserved.tr(),
      HOME_STATE.WAITING => LocaleKeys.onSale.tr(),
      HOME_STATE.SELLED => LocaleKeys.sold.tr()
    };
  }
}
