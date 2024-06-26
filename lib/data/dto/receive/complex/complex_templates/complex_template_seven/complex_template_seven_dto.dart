import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_seven/project_template_seven_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_template_seven_dto.g.dart';

@JsonSerializable()
class ComplexTemplateSevenDto {
  int? id;
  String? title;
  String? description;
  List<GalleryMediaDto>? galleries;
  MediaDto? mediaItem;
  List<GalleryMediaDto>? verticalGalleries;

  ComplexTemplateSevenDto(
      {this.id,
      this.title,
      this.description,
      this.galleries,
      this.mediaItem,
      this.verticalGalleries});
  factory ComplexTemplateSevenDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateSevenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateSevenDtoToJson(this);

  ComplexTemplateSevenEntity toEntity() => ComplexTemplateSevenEntity(
        id: id ?? 0,
        title: title ?? "",
        galleries: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
        verticalGalleries: verticalGalleries != null
            ? verticalGalleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
        description: description ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
