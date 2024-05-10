import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/button_widget.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/features_widget.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/project_detail_banner_widget.dart';
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
          child: ListView(
            children: [
              Observer(builder: (context) {
                if (value.projectEntity == null) {
                  return const SizedBox.shrink();
                }
                return ProjectDetailBannerWidget(
                  projectEntity: value.projectEntity!,
                );
              }),
              Gap(context.midSpacerSize),
              Observer(builder: (context) {
                if (value.projectEntity == null) {
                  return const SizedBox.shrink();
                }
                return Wrap(
                  children: value.projectEntity!.detail.features
                      .map((e) => FeaturesWidget(featuresEntity: e))
                      .toList(),
                );
              }),
              Gap(context.midSpacerSize),
              Center(
                child: Wrap(
                  children: value.actions
                      .map((e) => GestureDetector(
                          onTap: () => value.navigation
                              .navigateToPage(path: NavigationConstant.MAP),
                          child: ButtonWidget(text: e)))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
