import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/education/view_model/education_view_model.dart';
import 'package:goldcity/view/presentation/main/education/widget/education_row_widget.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EducationViewModel>(
      viewModel: EducationViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, EducationViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget tabletView(BuildContext context, EducationViewModel value) {
    return SizedBox(
      height: context.sHeight,
      width: context.sWidth,
      child: Stack(
        children: [
          Observer(
            builder: (context) {
              if (value.entity == null) {
                return const SizedBox.shrink();
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.entity!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: context.sWidth / 3,
                      child: EducationRowWidget(
                        onTap: () => value
                            .navigateEducationDetail(value.entity![index].id),
                        entity: value.entity![index],
                        isReverse: index % 2 == 0,
                      ));
                },
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top <= 0
                ? 10
                : MediaQuery.of(context).padding.top,
            left: 10,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 50,
                margin: context.largeSpacerOnlyHorizontal,
                height: 50,
                decoration: BoxDecoration(
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                    borderRadius: context.midRadius),
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneView(BuildContext context, EducationViewModel value) {
    return SafeArea(
      child: SizedBox(
        height: context.sHeight,
        width: context.sWidth,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 50,
                  margin: context.largeSpacerOnlyHorizontal,
                  height: 50,
                  decoration: BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.GOLD),
                      borderRadius: context.midRadius),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: Observer(
                builder: (context) {
                  if (value.entity == null) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: value.entity!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: context.sWidth,
                            height: context.sHeight * .95,
                            child: EducationRowWidget(
                              onTap: () => value.navigateEducationDetail(
                                  value.entity![index].id),
                              entity: value.entity![index],
                              isPhone: true,
                              isReverse: false,
                            ));
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
