import 'package:flutter/material.dart';

@immutable
final class LanguageEntity {
  final int id;
  final String name;
  final String code;

  const LanguageEntity(
      {required this.id, required this.name, required this.code});
}
