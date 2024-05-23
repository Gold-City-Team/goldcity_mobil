import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/widget/features_widget.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/view_model/future_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/widget/background_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FutureTemplateView extends StatelessWidget {
  const FutureTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FutureTemplateViewModel>(
      viewModel: FutureTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FutureTemplateViewModel value) =>
          Scaffold(
        body: Stack(
          children: [
            const BackgroundWidget(),
            SafeArea(
              child: Container(
                width: context.sWidth / 2,
                margin: context.largeSpacer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: context.largeSpacerOnlyLeft,
                      child: const LabelText(
                        text: "TRIO HILL RESIDENCE",
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                      ),
                    ),
                    Gap(context.midSpacerSize),
                    Padding(
                      padding: context.largeSpacerOnlyLeft,
                      child: const LabelText(
                        text:
                            "A world of its own that sits on an area of 211.677 m2. Lorem ipsum dolor sit amet",
                        fontSize: FONT_SIZE.BODY_LARGE,
                        textColor: APPLICATION_COLOR.SUBTITLE,
                      ),
                    ),
                    Gap(context.veryLargeSpacerSize),
                    Observer(builder: (context) {
                      if (value.projectEntity == null) {
                        return const SizedBox.shrink();
                      }
                      return SizedBox(
                        width: 400,
                        child: Wrap(
                          children: value.projectEntity!.detail.features
                              .map((e) => FeaturesWidget(featuresEntity: e))
                              .toSet()
                              .toList(),
                        ),
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
