import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/project_detail_banner_widget.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/project_detail_story_head_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:provider/provider.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          value.getProjectDetail();
          if (context.read<ThemeNotifier>().appTheme == APP_THEME.LIGHT) {
            context.setLocale(const Locale("tr", "TR"));
          } else {
            context.setLocale(const Locale("en", "US"));
          }
          context.read<ThemeNotifier>().toggleTheme();
        }),
        body: SafeArea(
          child: SingleChildScrollView(
              padding: context.zeroSpacer, child: bodyItems(context, value)),
        ),
      ),
    );
  }

  Widget bodyItems(BuildContext context, ProjectDetailViewModel value) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(builder: (context) {
            if (value.projectEntity == null) {
              return const SizedBox.shrink();
            }
            return ProjectDetailBannerWidget(
              title: value.projectEntity!.detail.title,
              slogan: value.projectEntity!.detail.slogan,
            );
          }),
          Gap(context.largeSpacerSize),
          Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: MaterialButton(
                minWidth: context.sWidth,
                onPressed: () => value.navigation
                    .navigateToPage(path: NavigationConstant.MAP),
                color: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                child: const LabelText(
                  textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                  text: "Olanaklar",
                )),
          ),
          Gap(context.largeSpacerSize),
          Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: MaterialButton(
                minWidth: context.sWidth,
                onPressed: () => value.navigation
                    .navigateToPage(path: NavigationConstant.LEAD_APPLY),
                color: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                child: const LabelText(
                  textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                  text: "Kayıt Ol",
                )),
          ),
          Gap(context.largeSpacerSize),
          Container(
            margin: context.midSpacerOnlyLeft,
            child: const LabelText(
              text: "Gold Condominium",
              fontSize: FONT_SIZE.TITLE_LARGE,
              textColor: APPLICATION_COLOR.GOLD,
            ),
          ),
          Gap(context.smallSpacerSize),
          Container(
            margin: context.midSpacerOnlyLeft,
            child: const LabelText(
              text:
                  "211.677m²’lik alanı ile Toros Dağları’nın eteklerine kurulu Goldcity, göz kamaştıran yapısıyla bir otel, lüks rezidanslar ve onların etrafında yine aynı güzellikteki villa ve dairelerden oluşmaktadır. Goldcity’nin aynı zamanda havuzlu müstakil villaları, dubleks teras katları ve lüks apartman dairelerinden oluşan çeşitli emlak ve mülklerinin satışı devam etmektedir.",
              textColor: APPLICATION_COLOR.SUBTITLE,
              fontSize: FONT_SIZE.BODY_MEDIUM,
            ),
          ),
          Gap(context.largeSpacerSize),
          Container(
            height: 110,
            margin: context.midSpacerOnlyLeft,
            child: ListView.builder(
              itemCount: 30,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const ProjectDetailStoryHeadWidget();
              },
            ),
          ),
          Container(
            margin: context.midSpacerOnlyLeft,
            child: const LabelText(
              text: "Ödüller",
              fontSize: FONT_SIZE.TITLE_LARGE,
              textColor: APPLICATION_COLOR.GOLD,
            ),
          ),
          Gap(context.smallSpacerSize),
          Container(
            margin: context.midSpacerOnlyLeft,
            child: const LabelText(
              text:
                  "211.677m²’lik alanı ile Toros Dağları’nın eteklerine kurulu Goldcity, göz kamaştıran yapısıyla bir otel, lüks rezidanslar ve onların etrafında yine aynı güzellikteki villa ve dairelerden oluşmaktadır. Goldcity’nin aynı zamanda havuzlu müstakil villaları, dubleks teras katları ve lüks apartman dairelerinden oluşan çeşitli emlak ve mülklerinin satışı devam etmektedir.",
              textColor: APPLICATION_COLOR.SUBTITLE,
              fontSize: FONT_SIZE.BODY_MEDIUM,
            ),
          ),
        ],
      );
}
