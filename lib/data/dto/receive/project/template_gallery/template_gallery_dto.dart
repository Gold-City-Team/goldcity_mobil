import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_gallery_dto.g.dart';

@JsonSerializable()
class TemplateGalleryDto {
  int? id;
  String? title;
  TemplateGalleryCategoryDto? category;
  MediaDto? mediaItem;
  TemplateGalleryDto({this.id, this.title, this.mediaItem, this.category});

  TemplateGalleryEntity toEntity() => TemplateGalleryEntity(
        id: id ?? 0,
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        galleryCategoryEntity: category != null
            ? category!.toEntity()
            : TemplateGalleryCategoryDto().toEntity(),
      );

  factory TemplateGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateGalleryDtoToJson(this);
}

@JsonSerializable()
class TemplateGalleryCategoryDto {
  int? id;
  TemplateGalleryCategoryTranslationDto? translations;
  TemplateGalleryCategoryDto({this.id, this.translations});

  factory TemplateGalleryCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateGalleryCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateGalleryCategoryDtoToJson(this);

  TemplateGalleryCategoryEntity toEntity() => TemplateGalleryCategoryEntity(
        id: id ?? 0,
        translations: translations != null
            ? translations!.toEntity()
            : TemplateGalleryCategoryTranslationDto().toEntity(),
      );
}

@JsonSerializable()
class TemplateGalleryCategoryTranslationDto {
  int? languageId;
  String? title;

  TemplateGalleryCategoryTranslationDto({this.languageId, this.title});

  factory TemplateGalleryCategoryTranslationDto.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateGalleryCategoryTranslationDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TemplateGalleryCategoryTranslationDtoToJson(this);

  TemplateGalleryCategoryTranslationEntity toEntity() =>
      TemplateGalleryCategoryTranslationEntity(
        languageId: languageId ?? 0,
        title: title ?? "",
      );
}
