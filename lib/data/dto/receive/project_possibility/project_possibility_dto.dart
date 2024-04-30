import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:goldcity/data/dto/receive/possibility/possibility_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_possibility_dto.g.dart';

@JsonSerializable()
class ProjectPossibilityDto {
  int id;
  LocationDto location;
  List<PossibilityDto> possibilities;

  ProjectPossibilityDto(
      {required this.id, required this.location, required this.possibilities});

  factory ProjectPossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectPossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectPossibilityDtoToJson(this);
}
