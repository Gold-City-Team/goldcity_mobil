import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_five/project_template_five_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_template_five_dto.g.dart';

@JsonSerializable()
class ProjectTemplateFiveDto {
  int? id;
  String? title;
  List<GalleryMediaDto>? medias;
  ProjectTemplateFiveDto({this.id, this.title, this.medias});
  factory ProjectTemplateFiveDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateFiveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateFiveDtoToJson(this);
  ProjectTemplateFiveEntity toEntity() => ProjectTemplateFiveEntity(
      id: id ?? 0,
      title: title ?? "",
      gallery: medias != null
          ? medias!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()]);
}
