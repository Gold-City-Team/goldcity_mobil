import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_features/project_features_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'complex_template_one_dto.g.dart';

@JsonSerializable()
class ComplexTemplateOneDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<ProjectFeaturesDto>? features;

  ComplexTemplateOneDto(
      {this.id, this.title, this.description, this.mediaItem, this.features});

  factory ComplexTemplateOneDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateOneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateOneDtoToJson(this);
}
