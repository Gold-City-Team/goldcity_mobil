import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/our_services/after_purchase/view/after_purchase_view.dart';
import 'package:goldcity/view/presentation/our_services/citizenship_page/view/citizenship_page_view.dart';
import 'package:goldcity/view/presentation/our_services/documents/view/documents_view.dart';
import 'package:goldcity/view/presentation/our_services/main_view/view_model/our_services_main_view_model.dart';
import 'package:goldcity/view/presentation/our_services/purchase/view/purchase_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class OurServicesMainView extends StatelessWidget {
  int index;
  OurServicesMainViewModel? viewModel;
  OurServicesMainView({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index > 4) {
      index = 0;
    }
    return BaseView<OurServicesMainViewModel>(
        viewModel: OurServicesMainViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
          viewModel = model;
        },
        onPageBuilder: (BuildContext context, OurServicesMainViewModel value) => Scaffold(
              backgroundColor: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
              body: ListView(
                shrinkWrap: false,
                children: [
                  Container(
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                    alignment: Alignment.center,
                    height: 400,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 400,
                          width: context.sWidth,
                          child: NormalNetworkImage(source: "https://condominium.zafercetin.dev/gunbatimi.webp", fit: BoxFit.cover),
                        ),
                        Container(
                          color: context.toColor(APPLICATION_COLOR.GOLD).withAlpha(60),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => context.pop(),
                              child: Container(
                                width: 50,
                                margin: context.largeSpacer,
                                height: 50,
                                decoration: BoxDecoration(color: context.toColor(APPLICATION_COLOR.GOLD), borderRadius: context.midRadius),
                                child: const Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                          ),
                        ),
                        Gap(context.largeSpacerSize),
                        LabelText(
                          text: context.tr("ourServices"),
                          align: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          fontSize: FONT_SIZE.DISPLAY_LARGE,
                          textColor: APPLICATION_COLOR.LIGHT,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      padding: context.midSpacerOnlyBottom,
                      child: Align(
                          alignment: Alignment.center, child: SizedBox(width: context.sWidth / 1.4, child: rowPart(context, index, viewModel!)))),
                  Gap(context.largeSpacerSize),
                  if (index == 0)
                    CitizenshipPageView()
                  else if (index == 1)
                    PurchaseView()
                  else if (index == 2)
                    DocumentsView()
                  else if (index == 3)
                    AfterPurchaseView()
                ],
              ),
            ));
  }
}

Widget rowPart(BuildContext context, int index, OurServicesMainViewModel viewmodel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => viewmodel.navigator(0),
            child: Container(
              height: 90,
              decoration: index == 0
                  ? BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      border: Border(bottom: BorderSide(width: 1, color: context.toColor(APPLICATION_COLOR.GOLD))))
                  : BoxDecoration(color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)),
              alignment: Alignment.center,
              child: LabelText(
                text: context.tr("ourServicesTab0"),
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: index == 0 ? APPLICATION_COLOR.LIGHT : APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => viewmodel.navigator(1),
            child: Container(
              margin: context.midSpacerOnlyHorizontal,
              height: 90,
              decoration: index == 1
                  ? BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      border: Border(bottom: BorderSide(width: 1, color: context.toColor(APPLICATION_COLOR.GOLD))))
                  : BoxDecoration(color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)),
              alignment: Alignment.center,
              child: LabelText(
                text: context.tr("ourServicesTab1"),
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: index == 1 ? APPLICATION_COLOR.LIGHT : APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => viewmodel.navigator(2),
            child: Container(
              height: 90,
              decoration: index == 2
                  ? BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      border: Border(bottom: BorderSide(width: 1, color: context.toColor(APPLICATION_COLOR.GOLD))))
                  : BoxDecoration(color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)),
              alignment: Alignment.center,
              child: LabelText(
                text: context.tr("ourServicesTab2"),
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: index == 2 ? APPLICATION_COLOR.LIGHT : APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => viewmodel.navigator(3),
            child: Container(
              height: 90,
              decoration: index == 3
                  ? BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      border: Border(bottom: BorderSide(width: 1, color: context.toColor(APPLICATION_COLOR.GOLD))))
                  : BoxDecoration(color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)),
              alignment: Alignment.center,
              child: LabelText(
                text: context.tr("ourServicesTab3"),
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: index == 3 ? APPLICATION_COLOR.LIGHT : APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => viewmodel.navigator(4),
            child: Container(
              height: 90,
              decoration: index == 4
                  ? BoxDecoration(
                      color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      border: Border(bottom: BorderSide(width: 1, color: context.toColor(APPLICATION_COLOR.GOLD))))
                  : BoxDecoration(color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)),
              alignment: Alignment.center,
              child: LabelText(
                text: context.tr("ourServicesTab4"),
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textColor: index == 4 ? APPLICATION_COLOR.LIGHT : APPLICATION_COLOR.SUBTITLE,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
