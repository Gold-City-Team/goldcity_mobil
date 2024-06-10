import 'package:goldcity/domain/entity/project/project_templates/project_template_seven/project_template_seven_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_seven_dto.g.dart';

@JsonSerializable()
class ProjectTemplateSevenDto {
  int? id;
  ProjectTemplateSevenVirtualTourDto? virtualTour;
  ProjectTemplateSevenDto({this.id, this.virtualTour});

  factory ProjectTemplateSevenDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateSevenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateSevenDtoToJson(this);

  ProjectTemplateSevenEntity toEntity() => ProjectTemplateSevenEntity(
        id: id ?? 0,
        url: virtualTour != null
            ? virtualTour!.toEntity()
            : ProjectTemplateSevenVirtualTourDto().toEntity(),
      );
}

@JsonSerializable()
class ProjectTemplateSevenVirtualTourDto {
  int? id;
  String? url;
  ProjectTemplateSevenVirtualTourDto({this.id, this.url});

  factory ProjectTemplateSevenVirtualTourDto.fromJson(
          Map<String, dynamic> json) =>
      _$ProjectTemplateSevenVirtualTourDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProjectTemplateSevenVirtualTourDtoToJson(this);

  String toEntity() => url ?? "";
}
