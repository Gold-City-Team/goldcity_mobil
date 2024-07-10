import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/education_detail/view_model/education_detail_view_model.dart';
import 'package:goldcity/view/presentation/education_detail/widget/education_detail_row_widget.dart';

class EducationDetailView extends StatelessWidget {
  final int educationId;
  const EducationDetailView({super.key, required this.educationId});

  @override
  Widget build(BuildContext context) {
    return BaseView<EducationDetailViewModel>(
      viewModel: EducationDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.educationId = educationId;
        model.init();
      },
      onPageBuilder: (BuildContext context, EducationDetailViewModel value) =>
          Scaffold(body: isTablet() ? tabletView(context, value) : Container()),
    );
  }

  Widget tabletView(BuildContext context, EducationDetailViewModel value) {
    return SafeArea(
      child: SizedBox(
        width: context.sWidth,
        child: Row(
          children: [
            Spacer(),
            SingleChildScrollView(
              child: Container(
                width: context.sWidth / 1.7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(context.midSpacerSize),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: context.toColor(APPLICATION_COLOR.GOLD),
                            borderRadius: context.midRadius),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    Gap(context.midSpacerSize),
                    Observer(builder: (context) {
                      if (value.educationEntity == null) {
                        return const SizedBox.shrink();
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: value.educationEntity!.detailEntity
                              .educationGalleries.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: context.midSpacerOnlyBottom,
                              child: EducationDetailRowWidget(
                                  entity: value.educationEntity!.detailEntity
                                      .educationGalleries[index]),
                            );
                          });
                    })
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
