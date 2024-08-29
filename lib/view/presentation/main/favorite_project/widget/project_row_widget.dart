import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goldcity/config/data/shared_manager.dart';

import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';

class ProjectFavoriteListWidget extends StatefulWidget {
  final ProjectEntity project;
  const ProjectFavoriteListWidget({required this.project, super.key});

  @override
  State<ProjectFavoriteListWidget> createState() =>
      _ProjectFavoriteListWidgetState();
}

class _ProjectFavoriteListWidgetState extends State<ProjectFavoriteListWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: isTablet() ? context.sHeight * .18 * 1.77 : context.sWidth,
            height: context.sHeight * .18,
            child: NormalNetworkImage(
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
                source: widget.project.mainImage.url),
          ),
          Container(
            color: context
                .toColor(
                  APPLICATION_COLOR.OVERLAY_COLOR,
                )
                .withAlpha(180),
          ),
          Container(
              width: isTablet() ? context.sHeight * .18 * 1.77 : context.sWidth,
              height: context.sHeight * .18,
              color: context.toColor(APPLICATION_COLOR.DARK).withOpacity(.70)),
          Center(
            child: SizedBox(
              height: 50,
              child: NormalNetworkImage(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  source: widget.project.logo.url),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                var favorite = locator<SharedManager>()
                    .getBoolStringValue("${widget.project.id}");
                favorite = !favorite;
                if (favorite) {
                  AnimatedSnackBar(
                      desktopSnackBarPosition:
                          DesktopSnackBarPosition.topCenter,
                      snackBarStrategy: RemoveSnackBarStrategy(),
                      builder: (context) => ErrorSnackBar(
                          message: "Proje Favorilerine Eklendi")).show(context);
                } else {
                  AnimatedSnackBar(
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.topCenter,
                          snackBarStrategy: RemoveSnackBarStrategy(),
                          builder: (context) => ErrorSnackBar(
                              message: "Proje Favorilerinden Çıkartıldı"))
                      .show(context);
                }

                locator<SharedManager>()
                    .setBoolStringValue("${widget.project.id}", favorite);
                setState(() {});
              },
              child: locator<SharedManager>()
                      .getBoolStringValue("${widget.project.id}")
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
          )
        ],
      ),
    );
  }
}
