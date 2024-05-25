// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery_media/project_gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class GalleryView extends StatefulWidget {
  final GALLERY_TYPE type;

  const GalleryView({
    required this.type,
    super.key,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.gallery_type = widget.type;
        model.init();
      },
      onPageBuilder: (BuildContext context, GalleryViewModel value) =>
          Scaffold(body: body(value, context)),
    );
  }

  CarouselController carouselController = CarouselController();
  Widget body(GalleryViewModel viewModel, BuildContext context) {
    return isTablet()
        ? tabletView(viewModel, carouselController)
        : phoneView(viewModel, carouselController);
  }

  Widget phoneView(GalleryViewModel viewModel, CarouselController controller) {
    ScrollController c = ScrollController();
    return Row(
      children: [
        SafeArea(
          right: false,
          top: false,
          bottom: false,
          child: Observer(builder: (context) {
            if (viewModel.selectedMediaIndex == -1) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              width: 100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: c,
                itemCount: viewModel.deneme.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 150,
                    width: 100,
                    child: GestureDetector(
                      onTap: () => {
                        viewModel.selectedMediaIndexChange(index),
                        controller.jumpToPage(index)
                      },
                      child: Padding(
                        padding: context.midSpacerOnlyBottom,
                        child: mediaPart(
                            ProjectGalleryMediaDto(
                                    mediaItem:
                                        MediaDto(url: viewModel.deneme[index]))
                                .toEntity(),
                            viewModel.selectedMediaIndex == index,
                            context),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
        Gap(context.midSpacerSize),
        Expanded(
          child: FlutterCarousel(
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    c.animateTo(index * 150,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  });
                  viewModel.selectedMediaIndexChange(index);
                },
                controller: controller,
                showIndicator: false,
                initialPage: viewModel.selectedMediaIndex,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pageSnapping: true),
            items: viewModel.deneme.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: context.midSpacerOnlyHorizontal,
                    width: context.sWidth,
                    child: NormalNetworkImage(
                      fit: BoxFit.contain,
                      source: i,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget tabletView(GalleryViewModel viewModel, CarouselController controller) {
    return SafeArea(
      bottom: isTablet(),
      top: isTablet(),
      left: isTablet(),
      right: isTablet(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              width: context.sWidth,
              child: FlutterCarousel(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      viewModel.selectedMediaIndexChange(index);
                    },
                    controller: carouselController,
                    showIndicator: false,
                    initialPage: viewModel.selectedMediaIndex,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    pageSnapping: true),
                items: viewModel.deneme.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: context.midSpacerOnlyHorizontal,
                        width: context.sWidth,
                        child: NormalNetworkImage(
                          fit: BoxFit.contain,
                          source: i,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          isTablet() ? Gap(context.largeSpacerSize) : const SizedBox.shrink(),
          isTablet()
              ? Observer(builder: (context) {
                  if (viewModel.selectedMediaIndex == -1) {
                    return const SizedBox.shrink();
                  }

                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: viewModel.deneme.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            viewModel.selectedMediaIndexChange(index),
                            carouselController.jumpToPage(index)
                          },
                          child: Padding(
                            padding: context.midSpacerOnlyLeft,
                            child: mediaPart(
                                ProjectGalleryMediaDto(
                                        mediaItem: MediaDto(
                                            url: viewModel.deneme[index]))
                                    .toEntity(),
                                viewModel.selectedMediaIndex == index,
                                context),
                          ),
                        );
                      },
                    ),
                  );
                })
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget mediaPart(ProjectGalleryMediaEntity mediaEntity, bool isSelected,
      BuildContext context) {
    return Container(
      width: 266,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: context.toColor(
              isSelected ? APPLICATION_COLOR.GOLD : APPLICATION_COLOR.LIGHT),
        ),
      ),
      child: Center(
        child: NormalNetworkImage(
          source: mediaEntity.media.url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
