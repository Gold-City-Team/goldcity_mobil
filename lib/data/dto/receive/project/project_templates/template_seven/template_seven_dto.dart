import 'package:goldcity/domain/entity/project/template/template_seven/template_seven_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_seven_dto.g.dart';

@JsonSerializable()
class TemplateSevenDto {
  int? id;
  TemplateSevenVirtualTourDto? virtualTour;
  TemplateSevenDto({this.id, this.virtualTour});

  factory TemplateSevenDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateSevenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateSevenDtoToJson(this);

  TemplateSevenEntity toEntity() => TemplateSevenEntity(
        id: id ?? 0,
        url: virtualTour != null
            ? virtualTour!.toEntity()
            : TemplateSevenVirtualTourDto().toEntity(),
      );
}

@JsonSerializable()
class TemplateSevenVirtualTourDto {
  int? id;
  String? url;
  TemplateSevenVirtualTourDto({this.id, this.url});

  factory TemplateSevenVirtualTourDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateSevenVirtualTourDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateSevenVirtualTourDtoToJson(this);

  String toEntity() => url ?? "";
}
