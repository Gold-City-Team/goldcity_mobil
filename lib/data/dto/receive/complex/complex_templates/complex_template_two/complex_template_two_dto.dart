import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_two/template_two_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'complex_template_two_dto.g.dart';

@JsonSerializable()
class ComplexTemplateTwoDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<GalleryMediaDto>? galleries;
  ComplexTemplateTwoMetaDataDto? metaData;

  ComplexTemplateTwoDto(
      {this.id,
      this.title,
      this.description,
      this.mediaItem,
      this.metaData,
      this.galleries});

  factory ComplexTemplateTwoDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateTwoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateTwoDtoToJson(this);

  ComplexTemplateTwoEntity toEntity() => ComplexTemplateTwoEntity(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      gallery: galleries != null
          ? galleries!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()],
      metaData: metaData != null
          ? metaData!.toEntity()
          : ComplexTemplateTwoMetaDataDto().toEntity());
}

@JsonSerializable()
class ComplexTemplateTwoMetaDataDto {
  String? mainImagePosition;

  ComplexTemplateTwoMetaDataDto({this.mainImagePosition});

  factory ComplexTemplateTwoMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateTwoMetaDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateTwoMetaDataDtoToJson(this);
  ComplexTemplateTwoMetaDataEntity toEntity() =>
      ComplexTemplateTwoMetaDataEntity(
          mainImagePosition: mainImagePosition ?? "left");
}
