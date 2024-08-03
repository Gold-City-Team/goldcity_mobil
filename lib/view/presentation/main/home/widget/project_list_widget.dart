import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectListWidget extends StatefulWidget {
  final ProjectEntity project;
  const ProjectListWidget({required this.project, super.key});

  @override
  State<ProjectListWidget> createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: (context.sWidth / 10) * 3,
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
          Center(
            child: SizedBox(
              height: 75,
              child: NormalNetworkImage(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  source: widget.project.logo.url),
            ),
          )
        ],
      ),
    );
  }
}
