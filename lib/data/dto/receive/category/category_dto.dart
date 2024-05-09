import 'package:goldcity/data/dto/receive/translation/translation_dto.dart';
import 'package:goldcity/domain/entity/category/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

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
