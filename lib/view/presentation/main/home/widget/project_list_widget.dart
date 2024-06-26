import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectListWidget extends StatefulWidget {
  final Function(int) onTap;

  final List<ProjectEntity> projectList;
  const ProjectListWidget(
      {required this.projectList, required this.onTap, super.key});

  @override
  State<ProjectListWidget> createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.projectList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => widget.onTap(widget.projectList[index].id),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                          width: 2)),
                  width: context.sWidth /
                      (widget.projectList.length > 5
                          ? 5
                          : (widget.projectList.length).toDouble()),
                  height: context.sHeight,
                  child: NormalNetworkImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                      source: widget.projectList[index].detail.mainImage.url),
                )
                    .animate()
                    .fade(duration: Duration(milliseconds: 600 * index))
                    .slideX(
                        begin: 2,
                        end: 0,
                        duration: Duration(milliseconds: 600 * index),
                        curve: Curves.ease),
                Container(
                  width: context.sWidth /
                      (widget.projectList.length > 5
                          ? 5
                          : (widget.projectList.length).toDouble()),
                  height: context.sHeight,
                  color: context
                      .toColor(
                        APPLICATION_COLOR.OVERLAY_COLOR,
                      )
                      .withAlpha(180),
                ),
                Center(
                  child: SizedBox(
                      width: context.sWidth /
                              (widget.projectList.length > 5
                                  ? 5
                                  : (widget.projectList.length).toDouble()) -
                          40,
                      child: NormalNetworkImage(
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          source: widget.projectList[index].detail.logo.url)),
                )
              ],
            ),
          );
        });
  }
}
