import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class MainRowWidget extends StatelessWidget {
  final ProjectGalleryMediaEntity mediaEntity;

  const MainRowWidget({required this.mediaEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mediaPart(mediaEntity.media, context),
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
              text: mediaEntity.description, fontSize: FONT_SIZE.LABEL_MEDIUM),
        ),
      ],
    );
  }

  Widget mediaPart(MediaEntity media, BuildContext context) {
    if (media.mediaType == MEDIA_TYPE.VIDEO) {
      return Expanded(
          child: VideoFrameView(fullScreen: () => null, url: media.url));
    }
    return SizedBox(
      width: context.sWidth,
      child: NormalNetworkImage(
        source: media.url,
        fit: BoxFit.contain,
      ),
    );
  }
}
