import 'package:flutter/material.dart';

@immutable
final class TranslationEntity {
  final int id;
  final String title;

  const TranslationEntity({required this.id, required this.title});
}
