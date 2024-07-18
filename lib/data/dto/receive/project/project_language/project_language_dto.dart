import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_language_dto.g.dart';

@JsonSerializable()
class ProjectLanguageDetailDto {
  int? id;
  String? name;
  String? code;
  ProjectLanguageDetailDto({
    this.id,
    this.name,
    this.code,
  });

  factory ProjectLanguageDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectLanguageDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLanguageDetailDtoToJson(this);

  ProjectLanguageDetailEntity toEntity() => ProjectLanguageDetailEntity(
      id: id ?? 0, name: name ?? "", code: code ?? "");
}
