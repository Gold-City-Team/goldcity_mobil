import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/gold_map/view_model/gold_map_view_model.dart';
import 'package:goldcity/view/presentation/gold_map/widget/facilities_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoldMapView extends StatelessWidget {
  GoldMapView({super.key});
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
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Observer(builder: (context) {
                if (value.projectPossibilityEntity == null) {
                  return const SizedBox.shrink();
                }
                return GoogleMap(
                  mapType: MapType.terrain,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        value.projectPossibilityEntity!.location.latitude,
                        value.projectPossibilityEntity!.location.longitude),
                  ),
                  tiltGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  markers: value.projectPossibilityEntity!.possibilities
                      .map(
                        (e) => Marker(
                          infoWindow: InfoWindow(
                              title: e.title, snippet: e.description),
                          markerId: MarkerId(e.id.toString()),
                          icon: BitmapDescriptor.defaultMarkerWithHue(120),
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
              Observer(builder: (context) {
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
                        return FacilitiesWidget(
                            possibilityEntity: value.projectPossibilityEntity!
                                .possibilities[index]);
                      },
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
