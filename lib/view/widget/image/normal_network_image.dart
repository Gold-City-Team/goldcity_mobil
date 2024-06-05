import 'package:flutter/material.dart';

class NormalNetworkImage extends StatelessWidget {
  final String source;
  final BoxFit fit;
  const NormalNetworkImage(
      {required this.source, super.key, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      source,
      fit: fit,
    );
  }
}
