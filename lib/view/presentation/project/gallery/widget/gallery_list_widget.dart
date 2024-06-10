import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/gallery_row_widget.dart';

class GalleryListWidget extends StatelessWidget {
  final List<GalleryMediaEntity> mediaList;
  final Function(int index) onIndexChanged;
  final int selectedIndex;

  const GalleryListWidget(
      {required this.mediaList,
      required this.selectedIndex,
      required this.onIndexChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: mediaList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onIndexChanged(index),
          child: SizedBox(
            width: 300,
            child: GalleryRowWidget(
                mediaEntity: mediaList[index],
                isSelected: index == selectedIndex),
          ),
        );
      },
    );
  }
}
