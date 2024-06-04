import 'package:goldcity/domain/entity/project/template/template_six/template_six_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'template_six_dto.g.dart';

@JsonSerializable()
class TemplateSixDto {
  int? id;
  String? title;
  List<ProjectHomeDto>? homes;

  TemplateSixDto({this.id, this.title, this.homes});

  factory TemplateSixDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateSixDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateSixDtoToJson(this);

  TemplateSixEntity toEntity() => TemplateSixEntity(
        id: id ?? 0,
        title: title ?? "",
        homes: homes != null
            ? homes!.map((e) => e.toEntity()).toList()
            : [ProjectHomeDto().toEntity()],
      );
}

@JsonSerializable()
class ProjectHomeDto {
  String? blok;
  String? no;
  String? floor;
  String? area;
  String? price;
  String? type;
  String? state;
  ProjectHomeDto({
    this.blok,
    this.no,
    this.floor,
    this.area,
    this.price,
    this.type,
    this.state,
  });
  factory ProjectHomeDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectHomeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectHomeDtoToJson(this);

  ProjectHomeEntity toEntity() => ProjectHomeEntity(
        blok: blok ?? "",
        no: no ?? "",
        floor: floor ?? "",
        area: area ?? "",
        price: price ?? "",
        type: type ?? "",
        state: state ?? "",
      );
}
