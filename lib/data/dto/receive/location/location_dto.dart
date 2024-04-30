import 'package:json_annotation/json_annotation.dart';
part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  int id;
  String title;
  double latitude;
  double longitude;
  LocationDto(
      {required this.id,
      required this.title,
      required this.latitude,
      required this.longitude});
  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
