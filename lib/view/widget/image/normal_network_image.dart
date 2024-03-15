import 'package:flutter/material.dart';

class NormalNetworkImage extends StatelessWidget {
  final String source;
  const NormalNetworkImage({required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(source,
        cacheHeight: 500, cacheWidth: 500, fit: BoxFit.cover);
  }
}
