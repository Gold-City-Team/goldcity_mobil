import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/complex/complex_detail/complex_detail_entity.dart';

@immutable
final class ComplexEntity {
  final int id;
  final ComplexDetailEntity complexDetail;

  const ComplexEntity({
    required this.id,
    required this.complexDetail,
  });
}
