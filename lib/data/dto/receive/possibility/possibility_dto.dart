import 'package:goldcity/data/dto/receive/category/category_dto.dart';
import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'possibility_dto.g.dart';

@JsonSerializable()
class PossibilityDto {
  int? id;
  String? title;
  String? description;
  double? color;
  LocationDto? location;
  MediaDto? mediaItem;
  CategoryDto? category;
  PossibilityDto({
    this.id,
    this.title,
    this.description,
    this.color,
    this.location,
    this.mediaItem,
    this.category,
  });
  factory PossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$PossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PossibilityDtoToJson(this);
  PossibilityEntity toEntity() => PossibilityEntity(
        id: id ?? 0,
        title: title ?? "",
        color: color ?? 120,
        description: description ?? "",
        location:
            location != null ? location!.toEntity() : LocationDto().toEntity(),
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        category:
            category != null ? category!.toEntity() : CategoryDto().toEntity(),
      );
}
