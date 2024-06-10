import 'package:goldcity/data/dto/receive/features/features_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_one/template_one_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_one_dto.g.dart';

@JsonSerializable()
class TemplateOneDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  List<FeaturesDto>? features;

  TemplateOneDto(
      {this.id, this.title, this.description, this.mediaItem, this.features});

  factory TemplateOneDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateOneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateOneDtoToJson(this);

  TemplateOneEntity toEntity() => TemplateOneEntity(
        id: id ?? 0,
        title: title ?? "",
        description: description ?? "",
        features: features != null
            ? features!.map((e) => e.toEntity()).toList()
            : [FeaturesDto().toEntity()],
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
