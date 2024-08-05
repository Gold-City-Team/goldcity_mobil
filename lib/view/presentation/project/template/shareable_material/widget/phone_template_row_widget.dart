import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneTemplateRowWidget extends StatelessWidget {
  final List<GalleryMediaEntity> gallery;
  final bool isFullView;

  const PhoneTemplateRowWidget(
      {required this.gallery, required this.isFullView, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacer,
      margin: context.midSpacerOnlyHorizontal,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
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
                      textColor: APPLICATION_COLOR.TITLE,
                      fontSize: FONT_SIZE.TITLE_LARGE,
                      text: gallery.first.category.translation.title)),
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
              Gap(context.smallSpacerSize),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () => share(
                        gallery, context.findRenderObject() as RenderBox?),
                    child: const Icon(Icons.link)),
              )
            ],
          ),
          isFullView
              ? ListView.builder(
                  padding: context.midSpacerOnlyHorizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: gallery.length,
                  itemBuilder: ((c, index) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => share([gallery[index]],
                            context.findRenderObject() as RenderBox?),
                        child: Column(
                          children: [
                            index == 0
                                ? Gap(context.largeSpacerSize)
                                : const SizedBox.shrink(),
                            Gap(context.largeSpacerSize),
                            Row(
                              children: [
                                Expanded(
                                  child: LabelText(
                                      textColor: APPLICATION_COLOR.SUBTITLE,
                                      text: gallery[index].media.oldFileName),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () =>
                                          openLink(gallery[index].media.url),
                                      child: const Icon(Icons.remove_red_eye)),
                                ),
                                Gap(context.midSpacerSize),
                                const Icon(Icons.link)
                              ],
                            ),
                            Gap(context.largeSpacerSize),
                            Container(
                              height: .3,
                              color: context
                                  .toColor(
                                      APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR)
                                  .withAlpha(150),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  void share(List<GalleryMediaEntity> galeryEdit, RenderBox? box) {
    var result = galeryEdit
        .map((e) => "${e.category.translation.title}: ${e.media.url}")
        .toString();
    result = result.substring(0, result.length - 1);
    result = result.substring(1);
    result = result.replaceAll(",", "\n\n");

    Share.share(result,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Future<void> openLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
