import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/gallery_list_widget.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/main_row_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GalleryView extends StatefulWidget {
  final GALLERY_TYPE type;
  final int projectDetailId;
  const GalleryView({
    required this.type,
    required this.projectDetailId,
    super.key,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

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

  Widget body(GalleryViewModel viewModel, BuildContext context) {
    return SafeArea(
      bottom: !viewModel.isFullScreen,
      top: !viewModel.isFullScreen,
      left: !viewModel.isFullScreen,
      right: !viewModel.isFullScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (context) {
              if (viewModel.projectGallery == null) {
                return const SizedBox.shrink();
              }
              return Expanded(
                child: MainRowWidget(
                    mediaEntity: viewModel.projectGallery!.projectGallery
                        .where((e) =>
                            e.media.mediaType.toHumanText() ==
                            viewModel.categoryIndex)
                        .toList()[viewModel.selectedMediaIndex]),
              );
            },
          ),
          Observer(
            builder: (context) {
              if (viewModel.projectGallery == null) {
                return const SizedBox.shrink();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: viewModel
                    .categoryList()
                    .map(
                      (e) => Expanded(
                        child: GestureDetector(
                          onTap: () => viewModel.changeCategory(e),
                          child: Container(
                            margin: context.midSpacerOnlyHorizontal,
                            decoration: BoxDecoration(
                              borderRadius: context.midRadius,
                              color: context.toColor(
                                  viewModel.categoryIndex == e
                                      ? APPLICATION_COLOR.GOLD
                                      : APPLICATION_COLOR
                                          .EXTRA_CLOSE_BACKGROUND_COLOR),
                            ),
                            alignment: Alignment.topCenter,
                            padding: context.largeSpacer,
                            child: LabelText(text: e),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          Gap(context.largeSpacerSize),
          Observer(builder: (context) {
            if (viewModel.projectGallery == null) {
              return const SizedBox.shrink();
            }
            return Expanded(
              child: GalleryListWidget(
                  onIndexChanged: (index) =>
                      viewModel.selectedMediaIndexChange(index),
                  selectedIndex: viewModel.selectedMediaIndex,
                  mediaList: viewModel.projectGallery!.projectGallery
                      .where((e) =>
                          e.media.mediaType.toHumanText() ==
                          viewModel.categoryIndex)
                      .toList()),
            );
          }),
        ],
      ),
    );
  }
}
