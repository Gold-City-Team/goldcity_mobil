import 'package:goldcity/domain/entity/location/location_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  int? id;
  String? title;
  double? latitude;
  double? longitude;
  LocationDto({this.id, this.title, this.latitude, this.longitude});
  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);

  LocationEntity toEntity() => LocationEntity(
        id: id ?? 0,
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
        title: title ?? "",
      );
}
