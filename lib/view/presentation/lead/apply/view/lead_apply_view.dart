import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/lead/apply/view_model/lead_apply_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';

class LeadApplyView extends StatelessWidget {
  const LeadApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LeadApplyViewModel>(
      viewModel: LeadApplyViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LeadApplyViewModel value) =>
          Scaffold(
        body: SafeArea(
            child: Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: context.sHeight,
                child: NormalNetworkImage(
                    fit: BoxFit.cover,
                    source:
                        "https://goldcitycondominium.com/_next/image?url=%2Fimages%2Fprojects%2FleJardin%2Flejardin.webp&w=1080&q=75"),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  padding: context.xlargeSpacerOnlyHorizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: context.midSpacerOnlyBottom,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.5,
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD)))),
                          child: LabelText(
                            text: "Başvuru Yap",
                            fontSize: FONT_SIZE.HEADLINE_LARGE,
                            fontWeight: FontWeight.bold,
                          )),
                      Gap(context.midSpacerSize),
                      LabelText(
                        text:
                            "Merak ettiğiniz her konu hakkında lütfen bize yazın. Temsilcimiz en kısa sürede size geri dönüş sağlayacaktır.",
                        fontSize: FONT_SIZE.LABEL_LARGE,
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(context.veryLargeSpacerSize),
                      LabelText(
                        text: LocaleKeys.nameSurnameQuestion.tr(),
                        textColor: APPLICATION_COLOR.GOLD,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("fullName"),
                            newText: (newText) => value.fullName = newText),
                      ),
                      Gap(context.largeSpacerSize),
                      LabelText(
                        text: LocaleKeys.telephoneQuestion.tr(),
                        fontWeight: FontWeight.w400,
                        textColor: APPLICATION_COLOR.GOLD,
                      ),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("telephone"),
                            newText: (newText) => value.telephone = newText),
                      ),
                      Gap(context.largeSpacerSize),
                      LabelText(
                        text: LocaleKeys.mailQuestion.tr(),
                        fontWeight: FontWeight.w400,
                        textColor: APPLICATION_COLOR.GOLD,
                      ),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("mailAdress"),
                            newText: (newText) => value.mailAdress = newText),
                      ),
                      Gap(context.largeSpacerSize),
                      SizedBox(
                        height: 40,
                        child: NormalButton(
                          backgroundColor: APPLICATION_COLOR.GOLD,
                          onTap: () => value.apply(),
                          textColor: APPLICATION_COLOR.LIGHT,
                          text: LocaleKeys.send.tr(),
                        ),
                      ),
                      Gap(context.largeSpacerSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(text: "Zaten partner misin?"),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => value.login(),
                              child: LabelText(
                                text: " Giriş Yap",
                                textColor: APPLICATION_COLOR.GOLD,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
