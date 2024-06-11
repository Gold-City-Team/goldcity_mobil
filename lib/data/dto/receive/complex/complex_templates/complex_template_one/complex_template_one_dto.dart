import 'package:goldcity/data/dto/receive/features/features_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_one/complex_template_one_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'complex_template_one_dto.g.dart';

@JsonSerializable()
class ComplexTemplateOneDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<FeaturesDto>? features;

  ComplexTemplateOneDto(
      {this.id, this.title, this.description, this.mediaItem, this.features});

  factory ComplexTemplateOneDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateOneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateOneDtoToJson(this);

  ComplexTemplateOneEntity toEntity() => ComplexTemplateOneEntity(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      features: features != null
          ? features!.map((e) => e.toEntity()).toList()
          : [FeaturesDto().toEntity()]);
}
