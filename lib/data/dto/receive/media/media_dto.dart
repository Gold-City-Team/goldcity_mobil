// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:json_annotation/json_annotation.dart';
part 'media_dto.g.dart';

enum MEDIA_TYPE {
  @JsonValue("IMAGE")
  IMAGE,
  @JsonValue("VIDEO")
  VIDEO
}

@JsonSerializable()
class MediaDto {
  int? id;
  String? url;
  MEDIA_TYPE? mediaType;

  MediaDto({this.id, this.url, this.mediaType});
  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);

  MediaEntity toEntity() => MediaEntity(
        id: id ?? 0,
        url: url != null ? "${SourcePath.MEDIA.rawValue()}$url" : "",
        mediaType: mediaType ?? MEDIA_TYPE.IMAGE,
      );
}
