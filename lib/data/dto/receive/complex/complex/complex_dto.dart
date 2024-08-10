import 'package:goldcity/data/dto/receive/complex/complex_detail/complex_detail_dto.dart';
import 'package:goldcity/data/dto/receive/language_detail/language_detail_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_dto.g.dart';

@JsonSerializable()
class ComplexDto {
  int? id;
  String? title;
  String? slogan;
  List<LanguageDetailDto>? languages;

  MediaDto? mainImage;
  MediaDto? logo;
  ComplexDetailDto? complexDetail;

  ComplexDto({this.id, this.title, this.slogan, this.complexDetail});
  factory ComplexDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDtoToJson(this);

  ComplexEntity toEntity() => ComplexEntity(
        mainImage:
            mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
        id: id ?? 0,
        title: title ?? "",
        languages: languages != null
            ? languages!.map((e) => e.toEntity()).toList()
            : [LanguageDetailDto().toEntity()],
        slogan: slogan ?? "",
        logo: logo != null ? logo!.toEntity() : MediaDto().toEntity(),
        complexDetail: complexDetail != null
            ? complexDetail!.toEntity()
            : ComplexDetailDto().toEntity(),
      );
}
