import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/gold_map/view_model/gold_map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoldMapView extends StatefulWidget {
  const GoldMapView({super.key});

  @override
  State<GoldMapView> createState() => _GoldMapViewState();
}

class _GoldMapViewState extends State<GoldMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BaseView<GoldMapViewModel>(
      viewModel: GoldMapViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GoldMapViewModel value) => Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Observer(builder: (context) {
              if (value.projectPossibilityEntity == null) {
                return const SizedBox.shrink();
              }

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      value.projectPossibilityEntity!.location.latitude,
                      value.projectPossibilityEntity!.location.longitude),
                  zoom: 15,
                ),
                tiltGesturesEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                markers: value.projectPossibilityEntity!.possibilities
                    .map(
                      (e) => Marker(
                        infoWindow:
                            InfoWindow(title: e.title, snippet: e.description),
                        markerId: MarkerId(e.id.toString()),
                        icon: BitmapDescriptor.defaultMarkerWithHue(e.color),
                        position: LatLng(
                          e.location.latitude,
                          e.location.longitude,
                        ),
                      ),
                    )
                    .toSet(),
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            }),
            SafeArea(
              child: Observer(builder: (context) {
                if (value.projectPossibilityEntity == null) {
                  return const SizedBox.shrink();
                }
                return SafeArea(
                  child: Container(
                    height: 125,
                    alignment: Alignment.bottomCenter,
                    child: ListView.builder(
                      itemCount:
                          value.projectPossibilityEntity!.possibilities.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if ((value.category == null ||
                                value.category ==
                                    value
                                        .projectPossibilityEntity!
                                        .possibilities[index]
                                        .category
                                        .translation
                                        .title) &&
                            value.projectPossibilityEntity!.possibilities[index]
                                .description.isNotEmpty) {
                          return GestureDetector(
                            onTap: () async {
                              value.changeSelectedIndex(index);
                              _controller.future.then(
                                (e) => e.animateCamera(
                                  CameraUpdate.newLatLng(
                                    LatLng(
                                        value
                                            .projectPossibilityEntity!
                                            .possibilities[value.selectedIndex]
                                            .location
                                            .latitude,
                                        value
                                            .projectPossibilityEntity!
                                            .possibilities[value.selectedIndex]
                                            .location
                                            .longitude),
                                  ),
                                ),
                              );
                              _controller.future.then((e) =>
                                  e.showMarkerInfoWindow(MarkerId(value
                                      .projectPossibilityEntity!
                                      .possibilities[value.selectedIndex]
                                      .id
                                      .toString())));
                            },
                            // child: FacilitiesWidget(
                            //     possibilityEntity: value
                            //         .projectPossibilityEntity!
                            //         .possibilities[index]),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                );
              }),
            ),
            Observer(builder: (context) {
              if (value.projectPossibilityEntity == null) {
                return const SizedBox.shrink();
              }
              return SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10, top: 20),
                          width: 250,
                          child: DropdownMenu(
                            hintText: "Tümü",
                            selectedTrailingIcon: Icon(
                              Icons.arrow_drop_up,
                              color: context.toColor(APPLICATION_COLOR.DARK),
                            ),
                            trailingIcon: Icon(
                              Icons.arrow_drop_down,
                              color: context.toColor(APPLICATION_COLOR.DARK),
                            ),
                            onSelected: (category) => setState(() {
                              value.changeCategory(category);
                            }),
                            textStyle: TextStyle(
                              color: context.toColor(APPLICATION_COLOR.DARK),
                            ),
                            dropdownMenuEntries: value.getCategoryOptions(),
                            initialSelection: value.getCategoryOptions().first,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
