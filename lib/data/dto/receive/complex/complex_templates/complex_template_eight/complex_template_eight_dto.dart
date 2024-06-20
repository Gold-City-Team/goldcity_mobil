import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_eight/complex_template_eight_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'complex_template_eight_dto.g.dart';

@JsonSerializable()
class ComplexTemplateEightDto {
  int? id;
  List<TitleDescriptionGalleriesDto>? titleDescriptionGalleries;
  ComplexTemplateEightDto({this.id, this.titleDescriptionGalleries});
  factory ComplexTemplateEightDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateEightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateEightDtoToJson(this);

  ComplexTemplateEightEntity toEntity() => ComplexTemplateEightEntity(
        id: id ?? 0,
        items: titleDescriptionGalleries != null
            ? titleDescriptionGalleries!.map((e) => e.toEntity()).toList()
            : [TitleDescriptionGalleriesDto().toEntity()],
      );
}
