import 'package:goldcity/domain/entity/translation/translation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'translation_dto.g.dart';

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
