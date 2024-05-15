// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:goldcity/data/dto/receive/project/project_gallery_media/project_gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_gallery_dto.g.dart';

enum GALLERY_TYPE { INTERIOR_GALLERY, OUTDOOR_GALLERY }

@JsonSerializable()
class ProjectGalleryDto {
  int? id;
  GalleryDto? gallery;

  ProjectGalleryDto({this.id, this.gallery});
  factory ProjectGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectGalleryDtoToJson(this);

  ProjectGalleryEntity toEntity() => ProjectGalleryEntity(
      id: id ?? 0,
      projectGallery: gallery != null
          ? gallery!.projectGallery!.map((e) => e.toEntity()).toList()
          : [ProjectGalleryMediaDto().toEntity()]);
}

@JsonSerializable()
class GalleryDto {
  int? id;
  @JsonKey(name: "medias")
  List<ProjectGalleryMediaDto>? projectGallery;

  GalleryDto({this.id, this.projectGallery});
  factory GalleryDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryDtoToJson(this);

  ProjectGalleryEntity toEntity() => ProjectGalleryEntity(
      id: id ?? 0,
      projectGallery: projectGallery != null
          ? projectGallery!.map((e) => e.toEntity()).toList()
          : [ProjectGalleryMediaDto().toEntity()]);
}
