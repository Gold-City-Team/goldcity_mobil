import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GalleryRowWidget extends StatelessWidget {
  final ProjectGalleryMediaEntity mediaEntity;
  final bool isSelected;
  const GalleryRowWidget(
      {super.key, required this.isSelected, required this.mediaEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected
          ? context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR)
          : context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      height: 150,
      child: Row(
        children: [
          Padding(padding: context.midSpacer, child: mediaPart(context)),
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

  Widget mediaPart(BuildContext context) {
    if (mediaEntity.media.mediaType == MEDIA_TYPE.VIDEO) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 177,
            height: 100,
            child: NormalNetworkImage(
              source: mediaEntity.media.mediaMetaData.thumbnail,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 50,
            child: CircleAvatar(
              backgroundColor: context.toColor(APPLICATION_COLOR.LIGHT),
              maxRadius: 28,
              child: Icon(
                color: context.toColor(APPLICATION_COLOR.GOLD),
                Icons.play_arrow,
              ),
            ),
          )
        ],
      );
    }
    return SizedBox(
      width: 177,
      height: 100,
      child: NormalNetworkImage(
        source: mediaEntity.media.url,
        fit: BoxFit.fill,
      ),
    );
  }
}
