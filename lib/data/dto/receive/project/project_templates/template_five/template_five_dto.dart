import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_five/template_five_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_five_dto.g.dart';

@JsonSerializable()
class TemplateFiveDto {
  int? id;
  String? title;
  List<GalleryMediaDto>? medias;
  TemplateFiveDto({this.id, this.title, this.medias});
  factory TemplateFiveDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateFiveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateFiveDtoToJson(this);
  TemplateFiveEntity toEntity() => TemplateFiveEntity(
      id: id ?? 0,
      title: title ?? "",
      gallery: medias != null
          ? medias!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()]);
}
