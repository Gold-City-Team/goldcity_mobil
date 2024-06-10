import 'package:goldcity/data/dto/receive/complex/complex_templates/complex_template_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_detail_dto.g.dart';

@JsonSerializable()
class ComplexDetailDto {
  int? id;
  String? title;
  MediaDto? mainImage;
  MediaDto? logo;
  List<ComplexTemplateDto>? templates;

  ComplexDetailDto(
      {this.id, this.title, this.mainImage, this.logo, this.templates});
  factory ComplexDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDetailDtoToJson(this);
}
