import 'package:goldcity/data/dto/receive/education/education_detail/education_detail_dto.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'education_dto.g.dart';

@JsonSerializable()
class EducationDto {
  int? id;
  EducationDetailDto? educationDetail;
  EducationDto({this.id, this.educationDetail});
  factory EducationDto.fromJson(Map<String, dynamic> json) =>
      _$EducationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EducationDtoToJson(this);
  EducationEntity toEntity() => EducationEntity(
        id: id ?? 0,
        detailEntity: educationDetail != null
            ? educationDetail!.toEntity()
            : EducationDetailDto().toEntity(),
      );
}
