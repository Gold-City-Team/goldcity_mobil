import 'package:goldcity/data/dto/receive/language/language_dto.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_detail_dto.g.dart';

@JsonSerializable()
class ProjectDetailDto {
  int? id;
  String? title;
  String? slogan;
  LanguageDto? language;

  ProjectDetailDto({this.id, this.title, this.slogan});
  factory ProjectDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailDtoToJson(this);
  ProjectDetailEntity toEntity() => ProjectDetailEntity(
        id: id ?? 0,
        title: title ?? "",
        slogan: slogan ?? "",
        language:
            language != null ? language!.toEntity() : LanguageDto().toEntity(),
      );
}
