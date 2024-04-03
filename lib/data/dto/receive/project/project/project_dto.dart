import 'package:goldcity/data/dto/receive/project/project_detail/project_detail_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  int? id;
  ProjectDetailDto? projectDetailDto;

  ProjectDto({this.id, this.projectDetailDto});
  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
  ProjectEntity toEntity() => ProjectEntity(
        id: id ?? 0,
        detail: projectDetailDto != null
            ? projectDetailDto!.toEntity()
            : ProjectDetailDto().toEntity(),
      );
}
