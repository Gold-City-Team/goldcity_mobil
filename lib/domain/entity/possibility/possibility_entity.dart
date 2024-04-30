import 'package:flutter/material.dart';

@immutable
class LocationEntity {
  final int id;
  final String title;
  final double latitude;
  final double longitude;

  const LocationEntity({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
  });
}
