import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/project_detail_banner_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:provider/provider.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
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
        children: [
          const ProjectDetailBannerWidget(),
          Gap(context.largeSpacerSize),
          Container(
            height: 66,
            margin: context.midSpacerOnlyLeft,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => value.navigation
                          .navigateToPage(path: NavigationConstant.STORY),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    context.toColor(APPLICATION_COLOR.GOLD))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(33),
                          child: const NormalNetworkImage(
                              source:
                                  "https://wallpapercave.com/wp/wp2752752.jpg"),
                        ),
                      ),
                    ),
                    Gap(context.midSpacerSize)
                  ],
                );
              },
            ),
          )
        ],
      );
}
