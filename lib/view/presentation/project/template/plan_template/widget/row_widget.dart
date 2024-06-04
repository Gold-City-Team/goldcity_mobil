import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class RowWidget extends StatelessWidget {
  final List<TemplateGalleryEntity> gallery;
  final bool isFullView;

  const RowWidget({required this.gallery, required this.isFullView, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacer,
      margin: context.midSpacerOnlyHorizontal,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
        borderRadius: context.midRadius,
      ),
      child: Column(
        children: [
          Row(
            children: [
              !isFullView
                  ? const Icon(Icons.arrow_drop_down)
                  : const Icon(Icons.arrow_drop_up),
              Gap(context.largeSpacerSize),
              Expanded(
                  child: LabelText(
                      text: gallery
                          .first.galleryCategoryEntity.translations.title)),
              const Spacer(),
              CircleAvatar(
                maxRadius: 14,
                backgroundColor:
                    context.toColor(APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR),
                child: LabelText(
                  text: "${gallery.length}",
                  textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                  fontSize: FONT_SIZE.LABEL_SMALL,
                ),
              ),
            ],
          ),
          isFullView
              ? Column(
                  children: [
                    Gap(context.largeSpacerSize),
                    Padding(
                      padding: context.midSpacerOnlyHorizontal,
                      child: Column(
                        children: [
                          Container(
                            height: .3,
                            color: context
                                .toColor(
                                    APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                .withAlpha(150),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: const Center(
                                    child: LabelText(text: "Daire No"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: const Center(
                                    child: LabelText(text: "m²"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: const Center(
                                    child: LabelText(text: "Fiyat"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: const Center(
                                    child: LabelText(text: "Tür"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: context
                                      .toColor(APPLICATION_COLOR.OPPOSITE_COLOR)
                                      .withAlpha(13),
                                  child: const Center(
                                    child: LabelText(text: "Durum"),
                                  ),
                                ),
                              ),
                              Container(
                                width: .5,
                                height: 50,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                            ],
                          ),
                          Container(
                            height: .3,
                            color: context
                                .toColor(
                                    APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                .withAlpha(150),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: context.midSpacerOnlyHorizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: gallery.length,
                      itemBuilder: ((c, index) {
                        return GestureDetector(
                          onTap: () => null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: LabelText(
                                          text: gallery[index]
                                              .mediaItem
                                              .oldFileName),
                                    ),
                                  ),
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                  const Expanded(
                                      child: Center(
                                          child: LabelText(text: "120 m²"))),
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                  const Expanded(
                                      child: Center(
                                          child: LabelText(text: "100.000 €"))),
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                  const Expanded(
                                      child: Center(
                                          child:
                                              LabelText(text: "Orta Daire"))),
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR.GREEN),
                                    child: const Center(
                                        child: LabelText(
                                      text: "Satışta",
                                      textColor: APPLICATION_COLOR.LIGHT,
                                    )),
                                  )),
                                  Container(
                                    width: .5,
                                    height: 50,
                                    color: context
                                        .toColor(APPLICATION_COLOR
                                            .CLOSE_BACKGROUND_COLOR)
                                        .withAlpha(150),
                                  ),
                                ],
                              ),
                              Container(
                                height: .3,
                                color: context
                                    .toColor(APPLICATION_COLOR
                                        .CLOSE_BACKGROUND_COLOR)
                                    .withAlpha(150),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
