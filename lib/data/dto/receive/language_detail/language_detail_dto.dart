import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'language_detail_dto.g.dart';

@JsonSerializable()
class LanguageDetailDto {
  int? id;
  String? name;
  String? code;
  MediaDto? mediaItem;
  LanguageDetailDto({
    this.id,
    this.name,
    this.code,
    this.mediaItem,
  });

  factory LanguageDetailDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDetailDtoToJson(this);

  LanguageDetailEntity toEntity() => LanguageDetailEntity(
        id: id ?? 0,
        name: name ?? "",
        code: code ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
