import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_five/project_template_five_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_template_five_dto.g.dart';

@JsonSerializable()
class ComplexTemplateFiveDto {
  int? id;
  String? title;
  List<GalleryMediaDto>? medias;
  ComplexTemplateFiveDto({this.id, this.title, this.medias});
  factory ComplexTemplateFiveDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateFiveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateFiveDtoToJson(this);
  ComplexTemplateFiveEntity toEntity() => ComplexTemplateFiveEntity(
      id: id ?? 0,
      title: title ?? "",
      gallery: medias != null
          ? medias!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()]);
}
