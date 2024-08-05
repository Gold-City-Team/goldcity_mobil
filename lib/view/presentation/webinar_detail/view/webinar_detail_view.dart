import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/webinar_detail/view_model/webinar_detail_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class WebinarDetailView extends StatelessWidget {
  final int meetingId;
  const WebinarDetailView({required this.meetingId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WebinarDetailViewModel>(
      viewModel: WebinarDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.meetingId = meetingId;
        model.init();
      },
      onPageBuilder: (BuildContext context, WebinarDetailViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget phoneView(BuildContext context, WebinarDetailViewModel value) {
    return Observer(builder: (context) {
      if (value.model == null) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.77777,
                child: NormalNetworkImage(source: value.model!.mediaItem.url),
              ),
              Column(
                children: [
                  Gap(context.midSpacerSize),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: context.largeSpacerOnlyHorizontal,
                        decoration: BoxDecoration(
                            color: context.toColor(APPLICATION_COLOR.GOLD),
                            borderRadius: context.midRadius),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(context.midSpacerSize),
          LabelText(
            text: value.model!.title,
            fontSize: FONT_SIZE.HEADLINE_MEDIUM,
          ),
          Gap(context.midSpacerSize),
          LabelText(
            text: value.model!.description,
            textColor: APPLICATION_COLOR.SUBTITLE,
          ),
          Gap(context.midSpacerSize),
          LabelText(
            text: value.model!.scheduledStartDate.formatTime,
            textColor: APPLICATION_COLOR.SUBTITLE,
          ),
          Gap(context.midSpacerSize),
          value.isLoading
              ? const SizedBox(
                  height: 35, width: 35, child: CircularProgressIndicator())
              : Padding(
                  padding: context.largeSpacerOnlyHorizontal,
                  child: SizedBox(
                    height: 35,
                    child: NormalButton(
                      onTap: () => value.apply(),
                      text: value.model!.isRegister
                          ? LocaleKeys.openWithZoom.tr()
                          : LocaleKeys.join.tr(),
                    ),
                  ))
        ],
      );
    });
  }

  Widget tabletView(BuildContext context, WebinarDetailViewModel value) {
    return Stack(
      children: [
        Observer(builder: (context) {
          if (value.model == null) {
            return const SizedBox.shrink();
          }
          return SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: NormalNetworkImage(source: value.model!.mediaItem.url),
          );
        }),
        Column(
          children: [
            Gap(context.midSpacerSize),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 50,
                  height: 50,
                  margin: context.largeSpacerOnlyHorizontal,
                  decoration: BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.GOLD),
                      borderRadius: context.midRadius),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: context.sHeight,
            margin: context.midSpacer,
            width: context.sWidth / 2.5,
            child: Stack(
              children: [
                Container(
                  color: context
                      .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                      .withAlpha(220),
                  height: context.sHeight,
                  margin: context.midSpacer,
                  width: context.sWidth / 2.5,
                ),
                Observer(builder: (context) {
                  if (value.model == null) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    height: context.sHeight,
                    margin: context.largeSpacer,
                    width: context.sWidth / 2.5,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(
                              text: value.model!.title,
                              fontSize: FONT_SIZE.HEADLINE_MEDIUM,
                            ),
                            Gap(context.midSpacerSize),
                            LabelText(
                              text: value.model!.description,
                              textColor: APPLICATION_COLOR.SUBTITLE,
                            ),
                            Gap(context.midSpacerSize),
                            LabelText(
                              text: value.model!.scheduledStartDate.formatTime,
                              textColor: APPLICATION_COLOR.SUBTITLE,
                            ),
                            Gap(context.midSpacerSize),
                            value.isLoading
                                ? const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: CircularProgressIndicator())
                                : Padding(
                                    padding: context.largeSpacerOnlyHorizontal,
                                    child: SizedBox(
                                      height: 35,
                                      child: NormalButton(
                                        onTap: () => value.apply(),
                                        text: value.model!.isRegister
                                            ? LocaleKeys.openWithZoom.tr()
                                            : LocaleKeys.join.tr(),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        )
      ],
    );
  }
}
