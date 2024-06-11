import 'package:goldcity/data/dto/receive/complex/complex_detail/complex_detail_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_dto.g.dart';

@JsonSerializable()
class ComplexDto {
  int? id;
  ComplexDetailDto? complexDetail;

  ComplexDto({this.id, this.complexDetail});
  factory ComplexDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDtoToJson(this);

  ComplexEntity toEntity() => ComplexEntity(
        id: id ?? 0,
        complexDetail: complexDetail != null
            ? complexDetail!.toEntity()
            : ComplexDetailDto().toEntity(),
      );
}
