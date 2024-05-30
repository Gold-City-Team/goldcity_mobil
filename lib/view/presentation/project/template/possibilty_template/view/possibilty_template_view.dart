import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_three/template_three_dto.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/possibilty_template/view_model/possibility_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/possibilty_template/widget/facilities_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PossibiltyTemplateView extends StatelessWidget {
  final int projectDetailId;
  final int projectSettingsId;
  const PossibiltyTemplateView(
      {required this.projectDetailId,
      required this.projectSettingsId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PossibilityTemplateViewModel>(
      viewModel: PossibilityTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectDetailId = projectDetailId;
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, PossibilityTemplateViewModel value) => Stack(
        alignment: isTablet() ? Alignment.centerLeft : Alignment.topCenter,
        children: [
          Observer(builder: (context) {
            if (value.templateThree == null) {
              return const SizedBox.shrink();
            }
            return GoogleMap(
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
          isTablet() ? tabletView(context, value) : phoneView(context, value),
        ],
      ),
    );
  }

  Widget phoneView(BuildContext context, PossibilityTemplateViewModel value) {
    return SafeArea(
      child: Observer(builder: (context) {
        if (value.templateThree == null || value.selectedPinIndex == -1) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
              color: context
                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                  .withAlpha(150),
              borderRadius: context.largeRadius),
          margin: context.midSpacerOnlyHorizontal,
          padding: context.midLargeSpacerOnlyVertical,
          height: 130,
          child: ListView.builder(
            itemCount: value.templateThree!.possibilities.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              if (value
                  .templateThree!.possibilities[index].description.isEmpty) {
                return const SizedBox.shrink();
              }
              return GestureDetector(
                onTap: () => value.changeSelectedPinIndex(index),
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: FacilitiesWidget(
                    isSelected: index == value.selectedPinIndex,
                    possibilityEntity: PossibilityDto(
                      title: value.templateThree!.possibilities[index].title,
                      description:
                          value.templateThree!.possibilities[index].description,
                      mediaItem: MediaDto(
                        url:
                            value.templateThree!.possibilities[index].media.url,
                      ),
                    ).toEntity(),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget tabletView(BuildContext context, PossibilityTemplateViewModel value) {
    return SafeArea(
      child: Observer(builder: (context) {
        if (value.templateThree == null || value.selectedPinIndex == -1) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
              color: context
                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                  .withAlpha(150),
              borderRadius: context.largeRadius),
          margin: context.midSpacer,
          padding: context.largeSpacerOnlyVertical,
          width: context.sWidth / 4,
          child: ListView.builder(
            itemCount: value.templateThree!.possibilities.length,
            itemBuilder: ((context, index) {
              if (value
                  .templateThree!.possibilities[index].description.isEmpty) {
                return const SizedBox.shrink();
              }
              return GestureDetector(
                onTap: () => value.changeSelectedPinIndex(index),
                child: Padding(
                  padding:
                      index != value.templateThree!.possibilities.length - 1
                          ? context.midSpacerOnlyBottom
                          : EdgeInsets.zero,
                  child: FacilitiesWidget(
                    isSelected: index == value.selectedPinIndex,
                    possibilityEntity: PossibilityDto(
                      title: value.templateThree!.possibilities[index].title,
                      description:
                          value.templateThree!.possibilities[index].description,
                      mediaItem: MediaDto(
                        url:
                            value.templateThree!.possibilities[index].media.url,
                      ),
                    ).toEntity(),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
