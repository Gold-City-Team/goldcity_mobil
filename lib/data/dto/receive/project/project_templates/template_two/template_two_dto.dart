import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/template_gallery/template_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_two/template_two_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_two_dto.g.dart';

@JsonSerializable()
class TemplateTwoDto {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  MediaDto? mediaItem;
  List<TemplateGalleryDto>? galleries;

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
            : [TemplateGalleryDto().toEntity()],
        id: id ?? 0,
        title: title ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
