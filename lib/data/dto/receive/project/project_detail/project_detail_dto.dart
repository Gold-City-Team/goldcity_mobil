import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_detail_dto.g.dart';

@JsonSerializable()
class ProjectDetailDto {
  int? id;
  String? title;
  String? slogan;
  List<MainTemplateDto>? templates;
  MediaDto? logo;
  MediaDto? mainImage;
  ProjectDetailDto(
      {this.id, this.title, this.slogan, this.templates, this.logo});
  factory ProjectDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailDtoToJson(this);
  ProjectDetailEntity toEntity() => ProjectDetailEntity(
      id: id ?? 0,
      title: title ?? "",
      slogan: slogan ?? "",
      mainImage:
          mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
      logo: logo != null ? logo!.toEntity() : MediaDto().toEntity(),
      template: templates != null
          ? templates!.map((e) => e.toEntity()).toList()
          : [MainTemplateDto().toEntity()]);
}
