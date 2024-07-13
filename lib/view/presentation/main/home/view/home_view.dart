import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/home/view_model/home_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
        body: Stack(
          children: [
            Observer(builder: (context) {
              if (value.pageList.isEmpty || value.pageIndex == -1) {
                return const SizedBox.shrink();
              }
              return FlutterCarousel(
                options: CarouselOptions(
                    showIndicator: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    scrollDirection: Axis.vertical,
                    padEnds: false,
                    height: context.sHeight,
                    aspectRatio: 1,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    keepPage: false,
                    pageSnapping: true),
                items: value.pageList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return i;
                    },
                  );
                }).toList(),
              );
            }),
            Observer(builder: (context) {
              if (value.pageList.isEmpty || value.pageIndex == -1) {
                return const SizedBox.shrink();
              }
              return SafeArea(
                child: Container(
                  margin: context.largeSpacer,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: value.pageIndex == 0 && !isTablet() ? 1 : 0,
                        child: SizedBox(
                          height: 50,
                          child: NormalNetworkImage(
                              source: value
                                  .complexList!.first.complexDetail.logo.url),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => value.togglePageSelector(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: context.toColor(APPLICATION_COLOR.GOLD),
                              borderRadius: context.midRadius),
                          child: Icon(
                            Icons.menu_rounded,
                            color: context.toColor(APPLICATION_COLOR.LIGHT),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Align(
              alignment: Alignment.centerRight,
              child: Observer(
                builder: (context) {
                  if (value.isPageSelectorLock) {
                    return const SizedBox.shrink();
                  }
                  return Align(
                    alignment: Alignment.centerRight,
                    child: PageSelectorWidget(
                      pages: [
                        context.tr("explore"),
                        context.tr("webinars"),
                        context.tr("educations"),
                        context.tr("settings")
                      ],
                      selectedIndex: 0,
                      newIndex: (newIndex) => value.changeIndex(newIndex),
                    )
                        .animate(
                            onComplete: (controller) =>
                                value.isPageSelectorVisible == false
                                    ? value.isPageSelectorLock = true
                                    : null,
                            key:
                                Key("${DateTime.now().millisecondsSinceEpoch}"))
                        .slideX(
                          begin: value.isPageSelectorVisible ? 1 : 0,
                          end: value.isPageSelectorVisible ? 0 : 1,
                          curve: Curves.easeOutCubic,
                          duration: Duration(milliseconds: 600),
                        ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
