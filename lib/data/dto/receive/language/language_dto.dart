import 'package:goldcity/domain/entity/language/language_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'language_dto.g.dart';

@JsonSerializable()
class LanguageDto {
  int? id;
  String? name;
  String? code;

  LanguageDto({this.id, this.name, this.code});
  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDtoToJson(this);

  LanguageEntity toEntity() => LanguageEntity(
        id: id ?? 0,
        name: name ?? "",
        code: code ?? "",
      );
}
