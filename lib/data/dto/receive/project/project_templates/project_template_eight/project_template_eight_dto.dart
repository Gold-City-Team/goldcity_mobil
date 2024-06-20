import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_eight/project_template_eight_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_eight_dto.g.dart';

@JsonSerializable()
class ProjectTemplateEightDto {
  int? id;
  List<TitleDescriptionGalleriesDto>? titleDescriptionGalleries;
  ProjectTemplateEightDto({this.id, this.titleDescriptionGalleries});
  factory ProjectTemplateEightDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateEightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateEightDtoToJson(this);

  ProjectTemplateEightEntity toEntity() => ProjectTemplateEightEntity(
        id: id ?? 0,
        items: titleDescriptionGalleries != null
            ? titleDescriptionGalleries!.map((e) => e.toEntity()).toList()
            : [TitleDescriptionGalleriesDto().toEntity()],
      );
}
