import 'package:goldcity/data/dto/receive/location/location_dto.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'possibility_dto.g.dart';

@JsonSerializable()
class PossibilityDto {
  int? id;
  String? title;
  String? description;
  String? color;
  LocationDto? location;
  PossibilityDto({
    this.id,
    this.title,
    this.description,
    this.color,
    this.location,
  });
  factory PossibilityDto.fromJson(Map<String, dynamic> json) =>
      _$PossibilityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PossibilityDtoToJson(this);
  PossibilityEntity toEntity() => PossibilityEntity(
        id: id ?? 0,
        title: title ?? "",
        color: color ?? "",
        description: description ?? "",
        location:
            location != null ? location!.toEntity() : LocationDto().toEntity(),
      );
}
