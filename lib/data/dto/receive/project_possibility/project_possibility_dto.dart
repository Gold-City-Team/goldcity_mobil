import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:goldcity/data/dto/receive/possibility/possibility_dto.dart';
import 'package:goldcity/domain/entity/project_possibility/project_possibility_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_possibility_dto.g.dart';

@JsonSerializable()
class ProjectPossibilityDto {
  int? id;
  LocationDto? location;
  List<PossibilityDto>? possibilities;

  ProjectPossibilityDto({this.id, this.location, this.possibilities});

  factory ProjectPossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectPossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectPossibilityDtoToJson(this);

  ProjectPossibilityEntity toEntity() => ProjectPossibilityEntity(
        id: id ?? 0,
        location:
            location != null ? location!.toEntity() : LocationDto().toEntity(),
        possibilities: possibilities != null
            ? possibilities!.map((e) => e.toEntity()).toList()
            : [PossibilityDto().toEntity()],
      );
}
