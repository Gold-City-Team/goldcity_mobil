import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NormalNetworkImage extends StatelessWidget {
  final String source;
  final BoxFit fit;
  final Alignment alignment;

  const NormalNetworkImage(
      {required this.source,
      super.key,
      this.alignment = Alignment.center,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: source,
      fit: fit,
      alignment: alignment,
    );
  }

  Future<Uint8List> test() async {
    // Fotoğraf dosyasının yolunu belirtin (assets klasörü içinde varsayılan olarak)
    String imagePath = 'assets/image/logo.png';

    // Fotoğraf dosyasını oku
    File file = File(imagePath);
    Uint8List bytes = await file.readAsBytes();

    // Base64 kodunu çözerek Uint8List'e dönüştür
    Uint8List uint8List = Uint8List.fromList(bytes);
    return uint8List;
  }
}
