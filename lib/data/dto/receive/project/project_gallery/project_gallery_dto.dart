import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_gallery_dto.g.dart';

@JsonSerializable()
class ProjectGalleryDto {
  int? id;
  MediaDto? media;
  String? title;
  String? description;

  ProjectGalleryDto({this.id, this.media, this.title, this.description});
  factory ProjectGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectGalleryDtoToJson(this);

  ProjectGalleryEntity toEntity() => ProjectGalleryEntity(
        id: id ?? 0,
        media: media != null ? media!.toEntity() : MediaDto().toEntity(),
        title: title ?? "",
        description: description ?? "",
      );
}
