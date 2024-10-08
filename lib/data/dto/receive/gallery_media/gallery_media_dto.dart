import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'gallery_media_dto.g.dart';

@JsonSerializable()
class GalleryMediaDto {
  int? id;
  MediaDto? mediaItem;
  GalleryMediaCategoryDto? category;
  String? title;
  String? description;
  GalleryMediaDto(
      {this.id, this.mediaItem, this.title, this.description, this.category});
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
        description: description ?? "",
        title: title ?? "",
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

@JsonSerializable()
class TitleDescriptionGalleriesDto {
  int? id;
  String? title;
  String? description;
  List<GalleryMediaDto>? galleries;
  TitleDescriptionGalleriesDto(
      {this.id, this.title, this.description, this.galleries});
  factory TitleDescriptionGalleriesDto.fromJson(Map<String, dynamic> json) =>
      _$TitleDescriptionGalleriesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TitleDescriptionGalleriesDtoToJson(this);

  TitleDescriptionGalleriesEntity toEntity() => TitleDescriptionGalleriesEntity(
        id: id ?? 0,
        title: title ?? "",
        description: description ?? "",
        galleries: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
      );
}
