import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FileIconWidget extends StatelessWidget {
  final AnnouncementFileEntity file;
  const FileIconWidget({required this.file, super.key});

  @override
  Widget build(BuildContext context) {
    if (file.file.mediaType == MEDIA_TYPE.VIDEO) {
      return Container(
        color:
            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR).withAlpha(100),
        width: 150,
        padding: context.midSpacer,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: context.toColor(APPLICATION_COLOR.DARK),
                  width: 150,
                  height: 150,
                  child: NormalNetworkImage(
                    source: file.file.mediaMetaData.thumbnail,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.GOLD),
                      borderRadius: context.xLargeRadius),
                  child: const Icon(Icons.play_arrow),
                )
              ],
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: LabelText(
                text: file.title,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
    } else if (file.file.mediaType == MEDIA_TYPE.IMAGE) {
      return Container(
        color:
            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR).withAlpha(100),
        width: 150,
        padding: context.midSpacer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: context.toColor(APPLICATION_COLOR.DARK),
              child: NormalNetworkImage(
                source: file.file.url,
                fit: BoxFit.contain,
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: LabelText(
                text: file.title,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
    } else if (file.file.mediaType == MEDIA_TYPE.SVG) {
      return Container(
        color:
            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR).withAlpha(100),
        width: 150,
        padding: context.midSpacer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              child: NormalNetworkImage(
                source:
                    "https://uxwing.com/wp-content/themes/uxwing/download/file-and-folder-type/svg-icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: LabelText(
                text: file.title,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        color:
            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR).withAlpha(100),
        width: 150,
        padding: context.midSpacer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: NormalNetworkImage(
                source:
                    "https://static.vecteezy.com/system/resources/previews/023/234/824/original/pdf-icon-red-and-white-color-for-free-png.png",
                fit: BoxFit.contain,
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: LabelText(
                text: file.title,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
    }
  }
}
