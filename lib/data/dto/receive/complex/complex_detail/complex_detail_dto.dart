import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_detail/complex_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_detail_dto.g.dart';

@JsonSerializable()
class ComplexDetailDto {
  int? id;
  String? title;
  String? slogan;
  MediaDto? mainVideo;
  MediaDto? logo;
  List<MainTemplateDto>? templates;

  ComplexDetailDto(
      {this.id,
      this.title,
      this.mainVideo,
      this.logo,
      this.templates,
      this.slogan});
  factory ComplexDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDetailDtoToJson(this);

  ComplexDetailEntity toEntity() => ComplexDetailEntity(
      id: id ?? 0,
      title: title ?? "",
      slogan: slogan ?? "",
      mainImage:
          mainVideo != null ? mainVideo!.toEntity() : MediaDto().toEntity(),
      logo: logo != null ? logo!.toEntity() : MediaDto().toEntity(),
      templates: templates != null
          ? templates!.map((e) => e.toEntity()).toList()
          : [MainTemplateDto().toEntity()]);
}
