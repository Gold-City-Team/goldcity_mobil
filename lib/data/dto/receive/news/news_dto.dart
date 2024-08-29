import 'package:easy_localization/easy_localization.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_dto.g.dart';

@JsonSerializable()
class NewsDto {
  int? id;
  String? title;
  String? content;
  String? shortContent;
  MediaDto? mediaItem;
  DateTime? createdAt;
  DateTime? updatedAt;

  NewsDto({
    this.id,
    this.title,
    this.content,
    this.shortContent,
    this.createdAt,
    this.updatedAt,
    this.mediaItem,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) =>
      _$NewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDtoToJson(this);

  NewsEntity toEntity() => NewsEntity(
        id: id ?? 0,
        title: title ?? "",
        shortContent: shortContent ?? "",
        createdAt: createdAt != null
            ? DateFormat("yyyy-MM-dd HH:mm:ss")
                .parse(createdAt.toString(), true)
                .toLocal()
            : DateTime.now(),
        updatedAt: updatedAt != null
            ? DateFormat("yyyy-MM-dd HH:mm:ss")
                .parse(updatedAt.toString(), true)
                .toLocal()
            : DateTime.now(),
        content: content ?? "",
        media:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      );
}
