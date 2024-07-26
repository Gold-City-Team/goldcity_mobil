import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'announcement_dto.g.dart';

@JsonSerializable()
class AnnouncementDto {
  int? id;
  String? title;
  String? description;
  List<AnnouncementFileDto>? attachments;
  AnnouncementDto({this.id, this.title, this.description, this.attachments});
  factory AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementDtoToJson(this);
  AnnouncementEntity toEntity() => AnnouncementEntity(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      attachments: attachments != null
          ? attachments!.map((e) => e.toEntity()).toList()
          : [AnnouncementFileDto().toEntity()]);
}

@JsonSerializable()
class AnnouncementFileDto {
  int? id;
  String? title;
  MediaDto? file;
  AnnouncementFileDto({this.id, this.title, this.file});
  factory AnnouncementFileDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementFileDtoToJson(this);

  AnnouncementFileEntity toEntity() => AnnouncementFileEntity(
      id: id ?? 0,
      title: title ?? "",
      file: file != null ? file!.toEntity() : MediaDto().toEntity());
}
