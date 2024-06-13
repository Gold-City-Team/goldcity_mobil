import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/main/home/view_model/home_view_model.dart';
import 'package:goldcity/view/presentation/main/home/widget/complex_row_phone_widget.dart';
import 'package:goldcity/view/presentation/main/home/widget/project_row_phone_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.smallSpacerSize),
            Container(
                margin: context.midSpacerOnlyHorizontal,
                height: 75,
                width: 75,
                child: Image.asset(
                  GeneralConstant.LOGO_ASSET_PATH,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: context.midSpacerOnlyHorizontal,
              child: LabelText(
                  text: LocaleKeys.explore.tr(),
                  textColor: APPLICATION_COLOR.TITLE,
                  fontSize: FONT_SIZE.HEADLINE_LARGE),
            ),
            Observer(builder: (context) {
              if (value.complexList == null) {
                return const SizedBox.shrink();
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.complexList!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: context.midSpacer,
                    child: ComplexRowPhoneWidget(
                        onTap: () => value.navigateComplexDetail(
                            value.complexList![index].id),
                        complexEntity: value.complexList![index]),
                  );
                }),
              );
            }),
            Padding(
              padding: context.midSpacerOnlyHorizontal,
              child: LabelText(
                  text: LocaleKeys.projects.tr(),
                  textColor: APPLICATION_COLOR.TITLE,
                  fontSize: FONT_SIZE.HEADLINE_LARGE),
            ),
            Observer(builder: (context) {
              if (value.projectList == null) {
                return const SizedBox.shrink();
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.projectList!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: context.midSpacer,
                    child: ProjectRowPhoneWidget(
                        onTap: () => value.navigateProjectDetail(
                            value.projectList![index].id),
                        projectEntity: value.projectList![index]),
                  );
                }),
              );
            }),
          ],
        ),
      )),
    );
  }
}
