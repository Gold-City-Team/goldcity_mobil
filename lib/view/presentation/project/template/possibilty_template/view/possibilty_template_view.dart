import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/possibility/possibility_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/template/possibilty_template/widget/facilities_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PossibiltyTemplateView extends StatelessWidget {
  const PossibiltyTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        const Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(39.925533, 32.866287),
              zoom: 10,
            ),
          ),
        ),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: context
                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                    .withAlpha(150),
                borderRadius: context.largeRadius),
            margin: context.midSpacer,
            padding: context.largeSpacerOnlyVertical,
            width: context.sWidth / 4,
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: index != 50
                      ? context.midSpacerOnlyBottom
                      : EdgeInsets.zero,
                  child: FacilitiesWidget(
                    possibilityEntity: PossibilityDto(
                      title: "Ankara",
                      description:
                          "Ankarayı arayın. Konuşulacak meseleler var.",
                      mediaItem: MediaDto(
                          url:
                              "https://goldcitycondominium.com/images/projects/golfAqua/ic/ic1.webp"),
                    ).toEntity(),
                  ),
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
