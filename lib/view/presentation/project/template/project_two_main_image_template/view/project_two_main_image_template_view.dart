import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_two_main_image_template/view_model/project_two_main_image_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectTwoMainImageTemplateView extends StatelessWidget {
  final int projectDetailId;
  final int projectSettingsId;
  const ProjectTwoMainImageTemplateView(
      {required this.projectDetailId,
      required this.projectSettingsId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectTwoMainImageTemplateViewModel>(
        viewModel: ProjectTwoMainImageTemplateViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.projectDetailId = projectDetailId;
          model.projectSettingsId = projectSettingsId;
          model.init();
        },
        onPageBuilder: (BuildContext context,
                ProjectTwoMainImageTemplateViewModel value) =>
            Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (context.sHeight / 100) * 85,
                      child: Observer(builder: (context) {
                        if (value.templateTwo == null) {
                          return const SizedBox.shrink();
                        }
                        return Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: context.sWidth / 2.2,
                                height: (context.sHeight / 100) * 85,
                                child: NormalNetworkImage(
                                    source: value.templateTwo!.mediaItem.url),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  child: Container(
                                    width: context.sWidth / 2.2,
                                    height: (context.sHeight / 100) * 85,
                                    color: context
                                        .toColor(APPLICATION_COLOR.DARK)
                                        .withOpacity(.4),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: context.largeSpacerOnlyLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: context.sWidth / 2.5,
                                    height: (context.sHeight / 100) * 85,
                                    child: Center(
                                      child: LabelText(
                                        text: value.templateTwo!.description,
                                        maxLines: 10,
                                        fontSize: FONT_SIZE.TITLE_MEDIUM,
                                      ),
                                    ),
                                  ),
                                  Gap(context.xlargeSpacerSize),
                                  ClipRRect(
                                    borderRadius: context.midRadius,
                                    child: SizedBox(
                                      width: (context.sWidth / 2.1),
                                      height: (context.sWidth / 2.1) / 1.7777,
                                      child: NormalNetworkImage(
                                          source:
                                              value.templateTwo!.mediaItem.url),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: context.largeSpacer,
                                child: LabelText(
                                  text: value.templateTwo!.title,
                                  maxLines: 1,
                                  fontSize: FONT_SIZE.DISPLAY_LARGE,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: context.largeSpacerOnlyHorizontal,
                      child: Observer(
                        builder: (context) {
                          if (value.templateTwo == null) {
                            return const SizedBox.shrink();
                          }
                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                              value.templateTwo!.gallery.length,
                              (index) => SizedBox(
                                width: context.sWidth / 3 - 20,
                                height: (context.sWidth / 3 - 20) / 1.7777,
                                child: GestureDetector(
                                  onTap: () => value.navigateGallery(value
                                      .templateTwo!.gallery
                                      .indexWhere((element) =>
                                          element ==
                                          value.templateTwo!.gallery[index])),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          width: context.sWidth / 3 - 20,
                                          height: (context.sWidth / 3 - 20) /
                                              1.7777,
                                          color: context
                                              .toColor(APPLICATION_COLOR.DARK),
                                          child: NormalNetworkImage(
                                            fit: BoxFit.cover,
                                            source: value
                                                        .templateTwo!
                                                        .gallery[index]
                                                        .media
                                                        .mediaType ==
                                                    MEDIA_TYPE.IMAGE
                                                ? value.templateTwo!
                                                    .gallery[index].media.url
                                                : value
                                                    .templateTwo!
                                                    .gallery[index]
                                                    .media
                                                    .mediaMetaData
                                                    .thumbnail,
                                          ),
                                        ),
                                      ).animate().fade().slide(
                                          duration: const Duration(
                                              milliseconds: 500)),
                                      value.templateTwo!.gallery[index].media
                                                  .mediaType ==
                                              MEDIA_TYPE.VIDEO
                                          ? Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: context.toColor(
                                                      APPLICATION_COLOR.GOLD),
                                                  borderRadius:
                                                      context.xLargeRadius),
                                              child:
                                                  const Icon(Icons.play_arrow),
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(context.veryLargeSpacerOnlyBottom.bottom)
                  ],
                ),
              ),
            ));
  }
}
