import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_gallery_dto.g.dart';

@JsonSerializable()
class TemplateGalleryDto {
  int? id;
  MediaDto? mediaItem;
  TemplateGalleryDto({this.id, this.mediaItem});

  TemplateGalleryEntity toEntity() => TemplateGalleryEntity(
      id: id ?? 0,
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity());

  factory TemplateGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateGalleryDtoToJson(this);
}
