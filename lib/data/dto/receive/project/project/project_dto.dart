import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_detail/project_detail_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDto {
  int? id;
  ProjectDetailDto? projectDetail;
  MediaDto? logo;
  MediaDto? mainImage;
  ProjectDto({this.id, this.projectDetail, this.logo, this.mainImage});
  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
  ProjectEntity toEntity() => ProjectEntity(
        id: id ?? 0,
        detail: projectDetail != null
            ? projectDetail!.toEntity()
            : ProjectDetailDto().toEntity(),
        mainImage:
            mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
        logo: logo != null ? logo!.toEntity() : MediaDto().toEntity(),
      );

  ProjectDto fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);
}
