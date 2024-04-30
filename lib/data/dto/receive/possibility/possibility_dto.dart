import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'possibility_dto.g.dart';

@JsonSerializable()
class PossibilityDto {
  int id;
  String title;
  String description;
  String color;
  LocationDto location;
  PossibilityDto({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.location,
  });
  factory PossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$PossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PossibilityDtoToJson(this);
}
