import 'package:easy_localization/easy_localization.dart';
import 'package:goldcity/domain/entity/news/comment_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  String? userName;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  CommentDto({this.userName, this.content, this.createdAt, this.updatedAt});
  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  CommentEntity toEntity() => CommentEntity(
        userName: userName ?? "",
        content: content ?? "",
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
      );
}
