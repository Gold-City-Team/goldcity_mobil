import 'package:goldcity/data/dto/receive/project/project_templates/project_template_three/project_template_three_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_three/complex_template_three_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_template_three_dto.g.dart';

@JsonSerializable()
class ComplexTemplateThreeDto {
  int? id;
  LocationDto? location;
  List<PossibilityDto>? possibilities;
  ComplexTemplateThreeDto({this.id, this.location, this.possibilities});

  factory ComplexTemplateThreeDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateThreeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateThreeDtoToJson(this);

  ComplexTemplateThreeEntity toEntity() => ComplexTemplateThreeEntity(
        id: id ?? 0,
        location:
            location != null ? location!.toEntity() : LocationDto().toEntity(),
        possibilities: possibilities != null
            ? possibilities!.map((e) => e.toEntity()).toList()
            : [PossibilityDto().toEntity()],
      );
}
