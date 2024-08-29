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
import 'package:goldcity/view/presentation/main/favorite_project/view_model/favorite_project_view_model.dart';
import 'package:goldcity/view/presentation/main/favorite_project/widget/project_row_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FavoriteProjectView extends StatelessWidget {
  const FavoriteProjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<FavoriteProjectViewModel>(
      viewModel: FavoriteProjectViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FavoriteProjectViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget tabletView(BuildContext context, FavoriteProjectViewModel value) {
    return SizedBox(
      height: context.sHeight,
      width: context.sWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Gap(context.largeSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(
              builder: (context) {
                if (value.projectList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(
                          text: LocaleKeys.favoriteNotFound.tr(),
                          fontSize: FONT_SIZE.HEADLINE_SMALL,
                          textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                        ),
                        Gap(context.midSpacerSize),
                        LabelText(
                          text: LocaleKeys.favoriteNotFoundDetailed.tr(),
                          fontSize: FONT_SIZE.TITLE_MEDIUM,
                          textColor: APPLICATION_COLOR.SUBTITLE,
                        ),
                      ],
                    ),
                  );
                }
                return Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: value.projectList
                      .map(
                        (e) => SizedBox(
                          width: isTablet()
                              ? context.sHeight * .18 * 1.77
                              : context.sHeight * .18 * 1.77,
                          height: isTablet()
                              ? context.sHeight * .18
                              : context.sHeight * .18,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => value.navigateProjectDetail(e.id),
                              child: Container(
                                margin: context.largeSpacerOnlyRight,
                                child: ProjectFavoriteListWidget(project: e),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneView(BuildContext context, FavoriteProjectViewModel value) {
    return Column(
      children: [
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 50,
                  margin: context.largeSpacer,
                  height: 50,
                  decoration: BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.GOLD),
                      borderRadius: context.midRadius),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
          ),
        ),
        Observer(
          builder: (context) {
            if (value.projectList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(
                      text: LocaleKeys.favoriteNotFound.tr(),
                      fontSize: FONT_SIZE.HEADLINE_SMALL,
                      textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                    ),
                    Gap(context.midSpacerSize),
                    LabelText(
                      align: TextAlign.center,
                      text: LocaleKeys.favoriteNotFoundDetailed.tr(),
                      fontSize: FONT_SIZE.TITLE_MEDIUM,
                      textColor: APPLICATION_COLOR.SUBTITLE,
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                padding: context.largeSpacerOnlyHorizontal,
                itemCount: value.projectList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.largeSpacerOnlyBottom,
                    width: context.sWidth,
                    height: context.sHeight * .18,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => value
                            .navigateProjectDetail(value.projectList[index].id),
                        child: ProjectFavoriteListWidget(
                            project: value.projectList[index]),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
