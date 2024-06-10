import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_dto.g.dart';

@JsonSerializable()
class ComplexDto {
  int? id;
  String? title;
  MediaDto? mainImage;
  MediaDto? logo;

  ComplexDto({this.id, this.title, this.mainImage, this.logo});
  factory ComplexDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDtoToJson(this);
}
