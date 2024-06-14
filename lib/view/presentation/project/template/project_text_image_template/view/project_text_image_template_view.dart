import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_text_image_template/view_model/project_text_image_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectTextImageTemplateView extends StatelessWidget {
  const ProjectTextImageTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectTextImageTemplateViewModel>(
      viewModel: ProjectTextImageTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ProjectTextImageTemplateViewModel value) =>
              Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: context.sHeight,
                      width: context.sWidth,
                      child: Stack(
                        children: [
                          Observer(builder: (context) {
                            if (value.template == null ||
                                value.images.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return Positioned(
                              right: 0,
                              bottom: 0,
                              child: SizedBox(
                                width: context.sWidth / 1.3,
                                height: context.sHeight / 1.3,
                                child: Stack(
                                  children: [
                                    NormalNetworkImage(
                                            fit: BoxFit.cover,
                                            source: value.images
                                                .where((element) =>
                                                    element.id ==
                                                    value
                                                        .selectedImageGalleryId)
                                                .first
                                                .media
                                                .url)
                                        .animate()
                                        .fade(
                                            duration:
                                                const Duration(seconds: 1)),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: context.sWidth / 1.3,
                                        height: context.sHeight / 1.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              context.toColor(APPLICATION_COLOR
                                                  .BACKGROUND_COLOR),
                                              context
                                                  .toColor(APPLICATION_COLOR
                                                      .BACKGROUND_COLOR)
                                                  .withOpacity(0)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          Observer(builder: (context) {
                            if (value.template == null ||
                                value.images.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return Positioned(
                              bottom: 40,
                              right: 0,
                              child: SizedBox(
                                height: 150,
                                width: context.sWidth / 2,
                                child: Container(
                                  color: context.toColor(
                                      APPLICATION_COLOR.BACKGROUND_COLOR),
                                  child: ListView.builder(
                                      itemCount: value.images.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => value
                                              .changeSelectedImageGalleryId(
                                                  value.images[index].id),
                                          child: Container(
                                            width: 150 * 1.7777,
                                            height: 150,
                                            margin: value.images.length - 1 !=
                                                    index
                                                ? context.largeSpacerOnlyRight
                                                : EdgeInsets.zero,
                                            child: NormalNetworkImage(
                                                source: value
                                                    .images[index].media.url),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Observer(builder: (context) {
                      if (value.template == null ||
                          value.description == "" ||
                          value.title == "") {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        margin: context.xlargeSpacerOnlyLeft,
                        width: context.sWidth / 2.5,
                        height: context.sHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(
                              text: value.title,
                              fontSize: FONT_SIZE.DISPLAY_LARGE,
                            ),
                            LabelText(
                              text: value.description,
                              fontSize: FONT_SIZE.TITLE_LARGE,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Gap(context.veryLargeSpacerOnlyBottom.bottom)
            ],
          ),
        ),
      ),
    );
  }
}
