import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_template/template_two/template_two_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_two_dto.g.dart';

@JsonSerializable()
class TemplateTwoDto {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  MediaDto? mediaItem;
  List<TemplateTwoGalleryDto>? galleries;

  TemplateTwoDto(
      {this.id, this.title, this.description, this.mediaItem, this.galleries});

  factory TemplateTwoDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateTwoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateTwoDtoToJson(this);

  TemplateTwoEntity toEntity() => TemplateTwoEntity(
        description: description ?? "",
        subTitle: subTitle ?? "",
        gallery: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [TemplateTwoGalleryDto().toEntity()],
        id: id ?? 0,
        title: title ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}

@JsonSerializable()
class TemplateTwoGalleryDto {
  int? id;
  MediaDto? mediaItem;
  TemplateTwoGalleryDto({this.id, this.mediaItem});

  TemplateTwoGalleryEntity toEntity() => TemplateTwoGalleryEntity(
      id: id ?? 0,
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity());

  factory TemplateTwoGalleryDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateTwoGalleryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateTwoGalleryDtoToJson(this);
}
