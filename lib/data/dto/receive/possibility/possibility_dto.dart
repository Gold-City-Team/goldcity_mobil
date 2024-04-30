import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'possibility_dto.g.dart';

@JsonSerializable()
class PossibilityDto {
  int id;
  LocationDto location;
  List<LocationDto> possibilities;
  PossibilityDto(
      {required this.id, required this.location, required this.possibilities});
  factory PossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$PossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PossibilityDtoToJson(this);
}
