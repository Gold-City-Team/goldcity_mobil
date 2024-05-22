// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names

import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'media_dto.g.dart';

enum MEDIA_TYPE {
  @JsonValue("IMAGE")
  IMAGE,
  @JsonValue("VIDEO")
  VIDEO,
  @JsonValue("SVG")
  SVG
}

extension MediaType on MEDIA_TYPE {
  String toHumanText() {
    switch (this) {
      case MEDIA_TYPE.IMAGE:
        return "Fotoğraflar";
      case MEDIA_TYPE.VIDEO:
        return "Videolar";
      case MEDIA_TYPE.SVG:
        return "Svgler";
    }
  }
}

@JsonSerializable()
class MediaDto {
  int? id;
  String? url;
  MEDIA_TYPE? mediaType;
  MediaMetaDataDto? metaData;
  MediaDto({this.id, this.url, this.mediaType, this.metaData});
  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);

  MediaEntity toEntity() => MediaEntity(
      id: id ?? 0,
      url: url ?? "",
      mediaType: mediaType ?? MEDIA_TYPE.IMAGE,
      mediaMetaData: metaData != null
          ? metaData!.toEntity()
          : MediaMetaDataDto().toEntity());
}

@JsonSerializable()
class MediaMetaDataDto {
  String? ThumbnailUrl;

  MediaMetaDataDto({this.ThumbnailUrl});
  factory MediaMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetaDataDtoToJson(this);
  MediaMetaDataEntity toEntity() =>
      MediaMetaDataEntity(thumbnail: ThumbnailUrl ?? "");
}
