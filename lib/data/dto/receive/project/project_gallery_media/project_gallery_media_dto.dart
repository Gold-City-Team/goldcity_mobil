import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_gallery_media_dto.g.dart';

@JsonSerializable()
class ProjectGalleryMediaDto {
  int? id;
  MediaDto? mediaItem;
  String? title;
  String? description;

  ProjectGalleryMediaDto(
      {this.id, this.mediaItem, this.title, this.description});
  factory ProjectGalleryMediaDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectGalleryMediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectGalleryMediaDtoToJson(this);

  ProjectGalleryMediaEntity toEntity() => ProjectGalleryMediaEntity(
        id: id ?? 0,
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        title: title ?? "",
        description: description ?? "",
      );
}
