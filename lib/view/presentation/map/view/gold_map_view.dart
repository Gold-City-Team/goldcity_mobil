import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/map/view_model/gold_map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoldMapView extends StatelessWidget {
  GoldMapView({super.key});
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BaseView<GoldMapViewModel>(
      viewModel: GoldMapViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, GoldMapViewModel value) => Scaffold(
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          cloudMapId: "547a472c2e8653af",
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          myLocationButtonEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            controller.moveCamera(CameraUpdate.newLatLng(const LatLng(35, 35)));

            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
