import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/features/project_features_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_features_dto.g.dart';

@JsonSerializable()
class ProjectFeaturesDto {
  int? id;
  String? title;
  String? value;
  MediaDto? mediaItem;
  ProjectFeaturesDto({this.id, this.title, this.value, this.mediaItem});
  factory ProjectFeaturesDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectFeaturesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectFeaturesDtoToJson(this);

  ProjectFeaturesEntity toEntity() => ProjectFeaturesEntity(
        id: id ?? 0,
        title: title ?? "",
        value: value ?? "",
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
