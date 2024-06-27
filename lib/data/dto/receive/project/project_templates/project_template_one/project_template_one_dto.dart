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
  MediaDto? logo;
  MediaDto? mainImage;
  List<FeaturesDto>? features;

  ProjectTemplateOneDto(
      {this.id,
      this.title,
      this.description,
      this.logo,
      this.mainImage,
      this.features});

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
        mainImage:
            mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
        logo: logo != null ? logo!.toEntity() : MediaDto().toEntity(),
      );
}
