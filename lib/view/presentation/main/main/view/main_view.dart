import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/main/main/view_model/main_view_model.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      viewModel: MainViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MainViewModel value) => Scaffold(
        bottomNavigationBar: Column(
          children: [
            Gap(MediaQuery.of(context).padding.bottom),
            Expanded(
              child: Observer(builder: (context) {
                return value.getView();
              }),
            ),
            Observer(
              builder: (context) {
                return SalomonBottomBar(
                  currentIndex: value.index,
                  onTap: (p0) => value.changeViewIndex(p0),
                  items: [
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.home),
                      title: Text(LocaleKeys.projects.tr()),
                      selectedColor: context.toColor(APPLICATION_COLOR.GOLD),
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.menu_book_sharp),
                      title: Text(LocaleKeys.educations.tr()),
                      selectedColor: context.toColor(APPLICATION_COLOR.GOLD),
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.settings),
                      title: Text(LocaleKeys.settings.tr()),
                      selectedColor: context.toColor(APPLICATION_COLOR.GOLD),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
