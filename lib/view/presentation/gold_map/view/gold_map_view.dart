import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/gold_map/view_model/gold_map_view_model.dart';
import 'package:goldcity/view/presentation/gold_map/widget/facilities_widget.dart';
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: _kGooglePlex,
              cloudMapId: "547a472c2e8653af",
              tiltGesturesEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              markers: {
                const Marker(
                    infoWindow:
                        InfoWindow(title: "fdsaf", snippet: "rsarfasdf"),
                    markerId: MarkerId("fs"),
                    position: LatLng(37.42796133580664, -122.085749655962)),
              },
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            SafeArea(
              child: Container(
                height: 125,
                alignment: Alignment.bottomCenter,
                child: ListView.builder(
                    itemCount: 100,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const FacilitiesWidget();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
