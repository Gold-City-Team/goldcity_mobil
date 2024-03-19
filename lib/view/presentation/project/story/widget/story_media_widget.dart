import 'package:flutter/material.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class StoryMediaWidget extends StatelessWidget {
  final String source;
  const StoryMediaWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sHeight,
      child: NormalNetworkImage(
        source: source,
      ),
    );
  }
}
