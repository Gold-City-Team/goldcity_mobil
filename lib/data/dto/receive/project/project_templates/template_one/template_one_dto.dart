import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_features/project_features_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_one_dto.g.dart';

@JsonSerializable()
class TemplateOneDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<ProjectFeaturesDto>? features;

  TemplateOneDto(
      {this.id, this.title, this.description, this.mediaItem, this.features});

  factory TemplateOneDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateOneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateOneDtoToJson(this);
}
