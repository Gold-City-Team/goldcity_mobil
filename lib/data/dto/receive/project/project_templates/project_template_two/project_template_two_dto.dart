import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_two/project_template_two_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_two_dto.g.dart';

@JsonSerializable()
class ProjectTemplateTwoDto {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  MediaDto? mediaItem;
  List<GalleryMediaDto>? galleries;
  ProjectTemplateTwoMetaDataDto? metaData;

  ProjectTemplateTwoDto(
      {this.id,
      this.title,
      this.description,
      this.mediaItem,
      this.metaData,
      this.galleries});

  factory ProjectTemplateTwoDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateTwoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateTwoDtoToJson(this);

  ProjectTemplateTwoEntity toEntity() => ProjectTemplateTwoEntity(
        description: description ?? "",
        subTitle: subTitle ?? "",
        gallery: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
        id: id ?? 0,
        title: title ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        metaData: metaData != null
            ? metaData!.toEntity()
            : ProjectTemplateTwoMetaDataDto().toEntity(),
      );
}

@JsonSerializable()
class ProjectTemplateTwoMetaDataDto {
  String? mainImagePosition;

  ProjectTemplateTwoMetaDataDto({this.mainImagePosition});

  factory ProjectTemplateTwoMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateTwoMetaDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateTwoMetaDataDtoToJson(this);

  TemplateTwoMetaDataEntity toEntity() => TemplateTwoMetaDataEntity(
      mainImagePosition: mainImagePosition ?? "right");
}
