import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GalleryRowWidget extends StatelessWidget {
  final ProjectGalleryMediaEntity mediaEntity;
  const GalleryRowWidget({super.key, required this.mediaEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      height: 100,
      child: Row(
        children: [
          Padding(padding: context.midSpacer, child: mediaPart()),
          Gap(context.midSpacerSize),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelText(
                    text: mediaEntity.title, fontSize: FONT_SIZE.TITLE_LARGE),
                Expanded(
                  child: LabelText(
                      text: mediaEntity.description,
                      fontSize: FONT_SIZE.LABEL_MEDIUM),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mediaPart() {
    if (mediaEntity.media.mediaType == MEDIA_TYPE.VIDEO) {
      return SizedBox(
        width: 100,
        height: 100,
        child: VideoFrameView(
          fullScreen: () => null,
          url: mediaEntity.media.url,
        ),
      );
    }
    return SizedBox(
      width: 100,
      height: 100,
      child: NormalNetworkImage(
        source: mediaEntity.media.url,
        fit: BoxFit.fill,
      ),
    );
  }
}
