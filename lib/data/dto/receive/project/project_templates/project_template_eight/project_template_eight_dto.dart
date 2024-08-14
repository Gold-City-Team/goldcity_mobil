import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_eight/project_template_eight_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_eight_dto.g.dart';

@JsonSerializable()
class ProjectTemplateEightDto {
  int? id;

  List<TitleDescriptionGalleriesDto>? titleDescriptionGalleries;

  ProjectTemplateEightMetaDataDto? metaData;

  ProjectTemplateEightDto(
      {this.id, this.titleDescriptionGalleries, this.metaData});

  factory ProjectTemplateEightDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateEightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateEightDtoToJson(this);

  ProjectTemplateEightEntity toEntity() {
    return ProjectTemplateEightEntity(
      id: id ?? 0,
      metaData: metaData != null
          ? metaData!.toEntity()
          : ProjectTemplateEightMetaDataDto().toEntity(),
      items: titleDescriptionGalleries != null
          ? titleDescriptionGalleries!.map((e) => e.toEntity()).toList()
          : [TitleDescriptionGalleriesDto().toEntity()],
    );
  }
}

@JsonSerializable()
class ProjectTemplateEightMetaDataDto {
  bool? isFilterable;
  ProjectTemplateEightMetaDataDto({this.isFilterable});

  factory ProjectTemplateEightMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateEightMetaDataDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProjectTemplateEightMetaDataDtoToJson(this);

  ProjectTemplateEightMetaDataEntity toEntity() =>
      ProjectTemplateEightMetaDataEntity(isFiltered: isFilterable ?? false);
}
