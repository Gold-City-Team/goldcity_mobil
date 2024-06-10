import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/features/features_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'features_dto.g.dart';

@JsonSerializable()
class FeaturesDto {
  int? id;
  String? title;
  String? value;
  MediaDto? mediaItem;
  FeaturesDto({this.id, this.title, this.value, this.mediaItem});
  factory FeaturesDto.fromJson(Map<String, dynamic> json) =>
      _$FeaturesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesDtoToJson(this);

  FeaturesEntity toEntity() => FeaturesEntity(
        id: id ?? 0,
        title: title ?? "",
        value: value ?? "",
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
