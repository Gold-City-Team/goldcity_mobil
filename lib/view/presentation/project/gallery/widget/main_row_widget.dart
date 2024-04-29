import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class MainRowWidget extends StatelessWidget {
  const MainRowWidget(
      {super.key, required this.onFullScreen, required this.mediaEntity});
  final ProjectGalleryMediaEntity mediaEntity;
  final VoidCallback onFullScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: mediaPart()),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.midSpacerOnlyLeft,
            child: LabelText(
                text: mediaEntity.title, fontSize: FONT_SIZE.TITLE_LARGE),
          ),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.midSpacerOnlyLeft,
            child: LabelText(
                text: mediaEntity.description,
                fontSize: FONT_SIZE.LABEL_MEDIUM),
          ),
        ],
      ),
    );
  }

  Widget mediaPart() {
    if (mediaEntity.media.mediaType == MEDIA_TYPE.VIDEO) {
      return VideoFrameView(fullScreen: () => onFullScreen());
    }
    return NormalNetworkImage(
      source: mediaEntity.media.url,
      fit: BoxFit.contain,
    );
  }
}
