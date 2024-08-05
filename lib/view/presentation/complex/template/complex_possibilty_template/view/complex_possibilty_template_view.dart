import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_three/project_template_three_dto.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/complex/template/complex_possibilty_template/view_model/complex_possibility_template_view_model.dart';
import 'package:goldcity/view/widget/facilities/facilities_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ComplexPossibiltyTemplateView extends StatelessWidget {
  final int detailId;
  final int settingsId;
  const ComplexPossibiltyTemplateView(
      {required this.detailId, required this.settingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexPossibilityTemplateViewModel>(
      viewModel: ComplexPossibilityTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.detailId = detailId;
        model.settingsId = settingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ComplexPossibilityTemplateViewModel value) =>
              Scaffold(
                  body: isTablet()
                      ? tabletView(context, value)
                      : phoneView(context, value)),
    );
  }

  Widget phoneView(
      BuildContext context, ComplexPossibilityTemplateViewModel value) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Observer(builder: (context) {
          if (value.templateThree == null) {
            return const SizedBox.shrink();
          }
          return GoogleMap(
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            compassEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              value.controller.complete(controller);
            },
            style: context.watch<ThemeNotifier>().appTheme == APP_THEME.DARK
                ? GeneralConstant.DARK_MAP_THEME
                : GeneralConstant.LIGHT_MAP_THEME,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(value.templateThree!.location.latitude,
                  value.templateThree!.location.longitude),
              zoom: 15,
            ),
            markers: value.templateThree!.possibilities
                .map(
                  (e) => Marker(
                    infoWindow:
                        InfoWindow(title: e.title, snippet: e.description),
                    icon: BitmapDescriptor.defaultMarkerWithHue(e.color),
                    markerId: MarkerId("${e.id}"),
                    position: LatLng(e.location.latitude, e.location.longitude),
                  ),
                )
                .toSet(),
          );
        }),
        SafeArea(
          child: Observer(builder: (context) {
            if (value.templateThree == null || value.selectedPinIndex == -2) {
              return const SizedBox.shrink();
            }
            return Container(
              decoration: BoxDecoration(
                color: context
                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                    .withAlpha(150),
              ),
              margin: context.midSpacerOnlyHorizontal,
              padding: context.midLargeSpacerOnlyVertical,
              height: 160,
              child: ListView.builder(
                itemCount: value.templateThree!.possibilities.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  if (value.templateThree!.possibilities[index].description
                      .isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => value.changeSelectedPinIndex(index),
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: FacilitiesWidget(
                          isSelected: index == value.selectedPinIndex,
                          possibilityEntity: PossibilityDto(
                            title:
                                value.templateThree!.possibilities[index].title,
                            description: value.templateThree!
                                .possibilities[index].description,
                            mediaItem: MediaDto(
                              url: value.templateThree!.possibilities[index]
                                  .media.url,
                            ),
                          ).toEntity(),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget tabletView(
      BuildContext context, ComplexPossibilityTemplateViewModel value) {
    return SafeArea(
      child: Row(
        children: [
          Observer(builder: (context) {
            if (value.templateThree == null || value.selectedPinIndex == -2) {
              return const SizedBox.shrink();
            }
            return Container(
              decoration: BoxDecoration(
                color: context
                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                    .withAlpha(150),
              ),
              margin: context.midSpacer,
              width: context.sWidth / 3,
              padding: context.largeSpacerOnlyVertical,
              child: ListView.builder(
                itemCount: value.templateThree!.possibilities.length,
                itemBuilder: ((context, index) {
                  if (value.templateThree!.possibilities[index].description
                      .isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => value.changeSelectedPinIndex(index),
                      child: Padding(
                        padding: index !=
                                value.templateThree!.possibilities.length - 1
                            ? context.midSpacerOnlyBottom
                            : EdgeInsets.zero,
                        child: FacilitiesWidget(
                          isSelected: index == value.selectedPinIndex,
                          possibilityEntity: PossibilityDto(
                            title:
                                value.templateThree!.possibilities[index].title,
                            description: value.templateThree!
                                .possibilities[index].description,
                            mediaItem: MediaDto(
                              url: value.templateThree!.possibilities[index]
                                  .media.url,
                            ),
                          ).toEntity(),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
          Expanded(
            child: Observer(builder: (context) {
              if (value.templateThree == null) {
                return const SizedBox.shrink();
              }
              return GoogleMap(
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                compassEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  value.controller.complete(controller);
                },
                style: context.watch<ThemeNotifier>().appTheme == APP_THEME.DARK
                    ? GeneralConstant.DARK_MAP_THEME
                    : GeneralConstant.LIGHT_MAP_THEME,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(value.templateThree!.location.latitude,
                      value.templateThree!.location.longitude),
                  zoom: 15,
                ),
                markers: value.templateThree!.possibilities
                    .map(
                      (e) => Marker(
                        infoWindow:
                            InfoWindow(title: e.title, snippet: e.description),
                        icon: BitmapDescriptor.defaultMarkerWithHue(e.color),
                        markerId: MarkerId("${e.id}"),
                        position:
                            LatLng(e.location.latitude, e.location.longitude),
                      ),
                    )
                    .toSet(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
