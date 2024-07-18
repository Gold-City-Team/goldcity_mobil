import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/education_detail/view_model/education_detail_view_model.dart';
import 'package:goldcity/view/presentation/education_detail/widget/education_detail_row_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class EducationDetailView extends StatelessWidget {
  final int educationId;
  const EducationDetailView({super.key, required this.educationId});

  @override
  Widget build(BuildContext context) {
    return BaseView<EducationDetailViewModel>(
      viewModel: EducationDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.educationId = educationId;
        model.init();
      },
      onPageBuilder: (BuildContext context, EducationDetailViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget tabletView(BuildContext context, EducationDetailViewModel value) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(context.largeSpacerSize),
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
            Gap(context.largeSpacerSize),
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return LabelText(
                text: value.educationEntity!.detailEntity.title,
                fontSize: FONT_SIZE.DISPLAY_MEDIUM,
              );
            }),
            Gap(context.midSpacerSize),
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return LabelText(
                text: value.educationEntity!.detailEntity.description,
                fontSize: FONT_SIZE.TITLE_LARGE,
                textColor: APPLICATION_COLOR.SUBTITLE,
              );
            }),
            Gap(context.xlargeSpacerSize),
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return Expanded(
                child: Padding(
                  padding: context.largeSpacerOnlyHorizontal,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.educationEntity!.detailEntity
                          .educationGalleries.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => value.openVideoPlayer(value
                              .educationEntity!
                              .detailEntity
                              .educationGalleries[index]
                              .id),
                          child: Padding(
                            padding: context.largeSpacerOnlyRight,
                            child: EducationDetailRowWidget(
                                entity: value.educationEntity!.detailEntity
                                    .educationGalleries[index]),
                          ),
                        );
                      }),
                ),
              );
            }),
            Gap(context.sHeight / 10),
          ],
        ),
      ),
    );
  }

  Widget phoneView(BuildContext context, EducationDetailViewModel value) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return LabelText(
                text: value.educationEntity!.detailEntity.title,
                align: TextAlign.center,
                fontSize: FONT_SIZE.DISPLAY_MEDIUM,
              );
            }),
            Gap(context.midSpacerSize),
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: LabelText(
                  text: value.educationEntity!.detailEntity.description,
                  fontSize: FONT_SIZE.TITLE_LARGE,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                  align: TextAlign.center,
                ),
              );
            }),
            Gap(context.xlargeSpacerSize),
            Observer(builder: (context) {
              if (value.educationEntity == null) {
                return const SizedBox.shrink();
              }
              return Expanded(
                child: Padding(
                  padding: context.largeSpacerOnlyHorizontal,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: value.educationEntity!.detailEntity
                          .educationGalleries.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => value.openVideoPlayer(value
                              .educationEntity!
                              .detailEntity
                              .educationGalleries[index]
                              .id),
                          child: Padding(
                            padding: context.midSpacerOnlyBottom,
                            child: EducationDetailRowWidget(
                                entity: value.educationEntity!.detailEntity
                                    .educationGalleries[index]),
                          ),
                        );
                      }),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
