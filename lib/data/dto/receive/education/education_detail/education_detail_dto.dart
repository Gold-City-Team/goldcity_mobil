import 'package:easy_localization/easy_localization.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_detail_dto.g.dart';

@JsonSerializable()
class EducationDetailDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mediaItem;
  DateTime? scheduledStartDate;
  bool? isRegister;
  EducationDetailDto(
      {this.id,
      this.title,
      this.description,
      this.mediaItem,
      this.scheduledStartDate,
      this.isRegister});

  factory EducationDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EducationDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EducationDetailDtoToJson(this);
  EducationDetailEntity toEntity() => EducationDetailEntity(
      id: id ?? 0,
      title: title ?? "",
      description: description ?? "",
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      scheduledStartDate: scheduledStartDate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(scheduledStartDate.toString(), true)
              .toLocal()
          : DateTime.now(),
      isRegister: isRegister ?? false);
}
