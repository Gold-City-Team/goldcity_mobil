import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_nine/project_template_nine_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_nine_dto.g.dart';

@JsonSerializable()
class ProjectTemplateNineDto {
  int? id;

  List<ProjectTemplateNineCampaignsDto>? campaigns;

  ProjectTemplateNineDto({this.id, this.campaigns});

  factory ProjectTemplateNineDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateNineDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateNineDtoToJson(this);
  ProjectTemplateNineEntity toEntity() => ProjectTemplateNineEntity(
        id: id ?? 0,
        campaigns: campaigns != null
            ? campaigns!.map((e) => e.toEntity()).toList()
            : [ProjectTemplateNineCampaignsDto().toEntity()],
      );
}

@JsonSerializable()
class ProjectTemplateNineCampaignsDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mainImage;
  ProjectTemplateNineCampaignsDto(
      {this.id, this.title, this.description, this.mainImage});

  factory ProjectTemplateNineCampaignsDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateNineCampaignsDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProjectTemplateNineCampaignsDtoToJson(this);
  ProjectTemplateNineCampaignsEntity toEntity() =>
      ProjectTemplateNineCampaignsEntity(
        id: id ?? 0,
        title: title ?? "",
        description: description ?? "",
        mainImage:
            mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
      );
}
