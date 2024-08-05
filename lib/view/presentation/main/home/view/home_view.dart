import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/presentation/main/home/view_model/home_view_model.dart';
import 'package:goldcity/view/presentation/main/home/widget/condominium_trailer_widget.dart';
import 'package:goldcity/view/presentation/main/home/widget/project_list_widget.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final CarouselController controller = CarouselController();
  final DropdownController dropdownController = DropdownController();
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
        body: SafeArea(
            child: isTablet()
                ? tabletView(context, value)
                : phoneView(context, value)),
      ),
    );
  }

  Widget phoneView(BuildContext context, HomeViewModel value) {
    return ListView(
      children: [
        SizedBox(
          height: context.sHeight * .90,
          child: Observer(builder: (context) {
            if (value.complexList == null) {
              return const SizedBox.shrink();
            }
            return CondominiumTrailerWidget(
                complexEntity: value.complexList!.last,
                onExploreTap: () =>
                    value.navigateComplexDetail(value.complexList!.last.id));
          }),
        ),
        Gap(context.midSpacerSize),
        Container(
          margin: context.largeSpacerOnlyLeft,
          child: LabelText(
            text: context.tr("projects"),
            fontSize: FONT_SIZE.HEADLINE_LARGE,
            textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
          ),
        ),
        Gap(context.largeSpacerSize),
        Observer(builder: (context) {
          if (value.complexList == null) {
            return const SizedBox.shrink();
          }
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.projectList!.length,
              itemBuilder: (context, index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => value
                        .navigateProjectDetail(value.projectList![index].id),
                    child: Container(
                      margin: context.midSpacerOnlyBottom,
                      child:
                          ProjectListWidget(project: value.projectList![index]),
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  Widget tabletView(BuildContext context, HomeViewModel value) {
    return Stack(
      children: [
        Observer(builder: (context) {
          if (value.complexList == null) {
            return const SizedBox.shrink();
          }
          return CondominiumTrailerWidget(
              complexEntity: value.complexList!.last,
              onExploreTap: () =>
                  value.navigateComplexDetail(value.complexList!.last.id));
        }),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: context.xLargeSpacerOnlyBottom,
            child: Observer(builder: (context) {
              if (value.projectList == null) {
                return const SizedBox.shrink();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: context.largeSpacerOnlyLeft,
                      child: LabelText(
                        text: context.tr("projects"),
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                        textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                      )),
                  Gap(context.largeSpacerSize),
                  Container(
                    height: context.sHeight * .25,
                    margin: context.largeSpacerOnlyLeft,
                    width: context.sWidth / 1.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.projectList!.length,
                        itemBuilder: (context, index) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => value.navigateProjectDetail(
                                  value.projectList![index].id),
                              child: Container(
                                margin: context.largeSpacerOnlyRight,
                                child: ProjectListWidget(
                                    project: value.projectList![index]),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }),
          ),
        ),
        Padding(
          padding: context.largeSpacer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: CoolDropdown(
                    resultOptions: ResultOptions(
                        render: ResultRender.all,
                        openBoxDecoration: BoxDecoration(
                            borderRadius: context.midRadius,
                            border: null,
                            color: context.toColor(APPLICATION_COLOR.LIGHT))),
                    controller: dropdownController,
                    dropdownList: context.supportedLocales
                        .map(
                          (element) => CoolDropdownItem(
                              icon: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(value.getFlagFromLanguage(
                                      element.languageCode)),
                                ),
                              ),
                              label: element
                                  .toLanguageTag()
                                  .localeToNativeLanguage,
                              value: element.toLanguageTag()),
                        )
                        .toList(),
                    onChange: (p0) {
                      context.setLocale(
                          Locale(p0.split("-")[0], p0.split("-")[1]));
                      Future.delayed(Duration(milliseconds: 50), () {
                        value.init();
                      });
                      dropdownController.close();
                    },
                    dropdownItemOptions: DropdownItemOptions(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      selectedTextStyle: TextStyle(
                        color: context.toColor(
                          APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR,
                        ),
                      ),
                      textStyle: TextStyle(
                        color: context.toColor(
                          APPLICATION_COLOR.OPPOSITE_COLOR,
                        ),
                      ),
                    ),
                    dropdownOptions: DropdownOptions(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                      color: context.toColor(
                        APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR,
                      ),
                    ),
                    defaultItem: CoolDropdownItem(
                        icon: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(value.getFlagFromLanguage(
                                context.locale.languageCode)),
                          ),
                        ),
                        label: context.locale
                            .toLanguageTag()
                            .localeToNativeLanguage,
                        value: context.locale.toLanguageTag()),
                  ),
                ),
              ),
              Gap(context.largeSpacerSize),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => value.togglePageSelector(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: Icon(
                      Icons.menu_rounded,
                      color: context.toColor(APPLICATION_COLOR.LIGHT),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Observer(
            builder: (context) {
              if (value.isPageSelectorLock) {
                return const SizedBox.shrink();
              }
              return Align(
                alignment: Alignment.centerRight,
                child: PageSelectorWidget(
                  pages: [
                    context.tr("explore"),
                    locator<AuthenticationSource>().isUserStillValid()
                        ? context.tr("webinars")
                        : "",
                    locator<AuthenticationSource>().isUserStillValid()
                        ? context.tr("educations")
                        : "",
                    locator<AuthenticationSource>().isUserStillValid()
                        ? context.tr("announcements")
                        : "",
                    context.tr("settings"),
                    !locator<AuthenticationSource>().isUserStillValid()
                        ? context.tr("beingPartner")
                        : ""
                  ],
                  selectedIndex: 0,
                  newIndex: (newIndex) => value.changeIndex(newIndex),
                )
                    .animate(
                        onComplete: (controller) =>
                            value.isPageSelectorVisible == false
                                ? value.isPageSelectorLock = true
                                : null,
                        key: Key("${DateTime.now().millisecondsSinceEpoch}"))
                    .slideX(
                      begin: value.isPageSelectorVisible ? 1 : 0,
                      end: value.isPageSelectorVisible ? 0 : 1,
                      curve: Curves.easeOutCubic,
                      duration: Duration(milliseconds: 600),
                    ),
              );
            },
          ),
        )
      ],
    );
  }
}
