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
import 'package:goldcity/view/presentation/main/webinar/view_model/webinar_view_model.dart';
import 'package:goldcity/view/presentation/main/webinar/widget/webinar_row_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class WebinarView extends StatelessWidget {
  const WebinarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WebinarViewModel>(
      viewModel: WebinarViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, WebinarViewModel value) => Scaffold(
        body: SafeArea(
          child: Observer(builder: (context) {
            if (value.model != null && value.model!.isEmpty) {
              return Stack(
                children: [
                  Padding(
                    padding: context.largeSpacer,
                    child: MouseRegion(
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(
                          text: LocaleKeys.webinarNotFound.tr(),
                          fontSize: FONT_SIZE.HEADLINE_SMALL,
                          textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                        ),
                        Gap(context.midSpacerSize),
                        LabelText(
                          text: LocaleKeys.webinarNotFoundDetailed.tr(),
                          fontSize: FONT_SIZE.TITLE_MEDIUM,
                          textColor: APPLICATION_COLOR.SUBTITLE,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(context.midSpacerSize),
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
                    Observer(
                      builder: (context) {
                        if (value.model == null) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          alignment: Alignment.topLeft,
                          width: context.sWidth,
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: value.model!
                                .map((e) => SizedBox(
                                    width: isTablet()
                                        ? context.sWidth / 3 - 20
                                        : context.sWidth,
                                    height: isTablet() ? 550 : 450,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                          onTap: () =>
                                              value.openDetailPage(e.id),
                                          child: WebinarRowWidget(entity: e)),
                                    )))
                                .toList(),
                          ),
                        );
                      },
                    ),
                    Gap(context.midSpacerSize)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
