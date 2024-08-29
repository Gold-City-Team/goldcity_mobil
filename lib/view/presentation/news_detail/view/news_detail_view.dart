import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/news_detail/view_model/news_detail_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';

class NewsDetailView extends StatelessWidget {
  final int newsId;
  const NewsDetailView({required this.newsId, super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<NewsDetailViewModel>(
      viewModel: NewsDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.newsId = newsId;
        model.init();
      },
      onPageBuilder: (BuildContext context, NewsDetailViewModel value) =>
          Scaffold(
        body: Center(
          child: Container(
            width: isTablet() ? context.sWidth / 2.5 : context.sWidth,
            color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
            height: context.sHeight,
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(builder: (context) {
              if (value.entity == null) {
                return const SizedBox();
              }
              return ListView(
                children: [
                  SizedBox(
                      width: isTablet() ? context.sWidth / 2.5 : context.sWidth,
                      height:
                          (isTablet() ? context.sWidth / 2.5 : context.sWidth) /
                              1.777,
                      child:
                          NormalNetworkImage(source: value.entity!.media.url)),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: value.entity!.title,
                    fontSize: FONT_SIZE.HEADLINE_MEDIUM,
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(text: value.entity!.content),
                  Gap(context.xlargeSpacerSize),
                  Container(
                    height: 1,
                    color: context.toColor(APPLICATION_COLOR.SUBTITLE),
                  ),
                  Gap(context.xlargeSpacerSize),
                  LabelText(
                    text: "Yorum Yap",
                    fontSize: FONT_SIZE.HEADLINE_MEDIUM,
                  ),
                  Gap(context.xlargeSpacerSize),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                          newText: (e) => value.userName = e,
                          hintText: LocaleKeys.nameSurnameQuestion.tr(),
                        ),
                      ),
                      Gap(context.xlargeSpacerSize),
                      SizedBox(
                        height: 100,
                        child: RoundedTextField(
                          maxLines: 4,
                          newText: (e) => value.content = e,
                          hintText: "Yorum",
                        ),
                      ),
                      Gap(context.largeSpacerSize),
                      SizedBox(
                        height: 40,
                        child: NormalButton(
                          backgroundColor: APPLICATION_COLOR.GOLD,
                          onTap: () => value.SendComment(),
                          textColor: APPLICATION_COLOR.LIGHT,
                          text: LocaleKeys.send.tr(),
                        ),
                      ),
                    ],
                  ),
                  Gap(context.xlargeSpacerSize),
                  Container(
                    height: 1,
                    color: context.toColor(APPLICATION_COLOR.SUBTITLE),
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: "Yorumlar",
                    fontSize: FONT_SIZE.HEADLINE_MEDIUM,
                  ),
                  Gap(context.xlargeSpacerSize),
                  Observer(builder: (context) {
                    if (value.commentList.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.commentList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                LabelText(
                                  text: value.commentList[index].userName,
                                  fontSize: FONT_SIZE.HEADLINE_SMALL,
                                ),
                                Spacer(),
                                Center(
                                  child: LabelText(
                                    text: value.commentList[index].createdAt
                                        .formatTimeDate,
                                    textColor: APPLICATION_COLOR.SUBTITLE,
                                  ),
                                ),
                              ],
                            ),
                            Gap(context.largeSpacerSize),
                            LabelText(
                              text: value.commentList[index].content,
                              textColor: APPLICATION_COLOR.SUBTITLE,
                            ),
                            Gap(context.largeSpacerSize),
                            Container(
                              height: 1,
                              color:
                                  context.toColor(APPLICATION_COLOR.SUBTITLE),
                            ),
                            Gap(context.largeSpacerSize),
                          ],
                        );
                      },
                    );
                  })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
