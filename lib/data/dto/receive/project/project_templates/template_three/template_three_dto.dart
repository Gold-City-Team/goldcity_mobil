import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_three/template_three_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_three_dto.g.dart';

@JsonSerializable()
class TemplateThreeDto {
  int? id;
  LocationDto? location;
  List<PossibilityDto>? possibilities;
  TemplateThreeDto({this.id, this.location, this.possibilities});

  factory TemplateThreeDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateThreeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateThreeDtoToJson(this);

  TemplateThreeEntity toEntity() => TemplateThreeEntity(
        id: id ?? 0,
        location:
            location != null ? location!.toEntity() : LocationDto().toEntity(),
        possibilities: possibilities != null
            ? possibilities!.map((e) => e.toEntity()).toList()
            : [PossibilityDto().toEntity()],
      );
}

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

@JsonSerializable()
class CategoryDto {
  int? id;
  TranslationDto? translation;

  CategoryDto({this.id, this.translation});
  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  CategoryEntity toEntity() => CategoryEntity(
      id: id ?? 0,
      translation: translation != null
          ? translation!.toEntity()
          : TranslationDto().toEntity());
}

@JsonSerializable()
class TranslationDto {
  int? id;
  String? title;
  TranslationDto({this.id, this.title});
  factory TranslationDto.fromJson(Map<String, dynamic> json) =>
      _$TranslationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationDtoToJson(this);
  TranslationEntity toEntity() =>
      TranslationEntity(id: id ?? 0, title: title ?? "");
}
