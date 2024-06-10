import 'package:goldcity/data/dto/receive/features/features_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_one/project_template_one_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_one_dto.g.dart';

@JsonSerializable()
class ProjectTemplateOneDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<FeaturesDto>? features;

  ProjectTemplateOneDto(
      {this.id, this.title, this.description, this.mediaItem, this.features});

  factory ProjectTemplateOneDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateOneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateOneDtoToJson(this);

  ProjectTemplateOneEntity toEntity() => ProjectTemplateOneEntity(
        id: id ?? 0,
        title: title ?? "",
        description: description ?? "",
        features: features != null
            ? features!.map((e) => e.toEntity()).toList()
            : [FeaturesDto().toEntity()],
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
