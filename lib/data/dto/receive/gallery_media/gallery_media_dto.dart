import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'gallery_media_dto.g.dart';

@JsonSerializable()
class GalleryMediaDto {
  int? id;
  MediaDto? mediaItem;
  GalleryMediaCategoryDto? category;

  GalleryMediaDto({this.id, this.mediaItem});
  factory GalleryMediaDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryMediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryMediaDtoToJson(this);
  GalleryMediaEntity toEntity() => GalleryMediaEntity(
        id: id ?? 0,
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        category: category != null
            ? category!.toEntity()
            : GalleryMediaCategoryDto().toEntity(),
      );
}

@JsonSerializable()
class GalleryMediaCategoryDto {
  int? id;
  GalleryMediaCategoryTranslationDto? translation;

  GalleryMediaCategoryDto({this.id, this.translation});
  factory GalleryMediaCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryMediaCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryMediaCategoryDtoToJson(this);

  GalleryMediaCategoryEntity toEntity() => GalleryMediaCategoryEntity(
        id: id ?? 0,
        translation: translation != null
            ? translation!.toEntity()
            : GalleryMediaCategoryTranslationDto().toEntity(),
      );
}

@JsonSerializable()
class GalleryMediaCategoryTranslationDto {
  int? id;
  String? title;

  GalleryMediaCategoryTranslationDto({this.id, this.title});
  factory GalleryMediaCategoryTranslationDto.fromJson(
          Map<String, dynamic> json) =>
      _$GalleryMediaCategoryTranslationDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GalleryMediaCategoryTranslationDtoToJson(this);

  GalleryMediaCategoryTranslationEntity toEntity() =>
      GalleryMediaCategoryTranslationEntity(id: id ?? 0, title: title ?? "");
}
