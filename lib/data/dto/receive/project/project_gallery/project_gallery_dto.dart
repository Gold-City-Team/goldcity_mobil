import 'package:goldcity/data/dto/receive/project/project_gallery_media/project_gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_gallery_dto.g.dart';

@JsonSerializable()
class ProjectGalleryDto {
  int? id;
  @JsonKey(name: "projectGalleries")
  List<ProjectGalleryMediaDto>? projectGallery;

  ProjectGalleryDto({this.id, this.projectGallery});
  factory ProjectGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectGalleryDtoToJson(this);

  ProjectGalleryEntity toEntity() => ProjectGalleryEntity(
      id: id ?? 0,
      projectGallery: projectGallery != null
          ? projectGallery!.map((e) => e.toEntity()).toList()
          : [ProjectGalleryMediaDto().toEntity()]);
}
