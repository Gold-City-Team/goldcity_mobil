import 'package:flutter/material.dart';
import 'package:goldcity/util/extension/design_extension.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: context.largeRadius,
        color: Colors.red,
      ),
      margin: context.midSpacerOnlyHorizontal,
    );
  }
}
