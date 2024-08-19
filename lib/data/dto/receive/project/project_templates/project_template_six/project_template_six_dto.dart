// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_six/project_template_six_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_template_six_dto.g.dart';

enum HOME_STATE {
  @JsonValue("RESERVED")
  RESERVED,
  @JsonValue("SOLD")
  SOLD,
  @JsonValue("ON_SALE")
  ON_SALE
}

@JsonSerializable()
class ProjectTemplateSixDto {
  int? id;
  List<ProjectHomeDto>? homes;
  List<GalleryMediaDto>? galleries;

  ProjectTemplateSixDto({this.id, this.galleries, this.homes});

  factory ProjectTemplateSixDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateSixDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateSixDtoToJson(this);

  ProjectTemplateSixEntity toEntity() => ProjectTemplateSixEntity(
        id: id ?? 0,
        gallery: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
        homes: homes != null
            ? homes!.map((e) => e.toEntity()).toList()
            : [ProjectHomeDto().toEntity()],
      );
}

@JsonSerializable()
class ProjectHomeDto {
  int? id;
  String? block;
  String? number;
  String? roomSize;
  String? floor;
  String? area;
  String? price;
  String? homeType;
  HOME_STATE? saleState;
  List<GalleryMediaDto>? imageGalleries;
  List<GalleryMediaDto>? videoGalleries;
  ProjectHomeDto({
    this.id,
    this.block,
    this.number,
    this.floor,
    this.price,
    this.area,
    this.roomSize,
    this.homeType,
    this.saleState,
  });
  factory ProjectHomeDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectHomeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectHomeDtoToJson(this);

  ProjectHomeEntity toEntity() => ProjectHomeEntity(
      id: id ?? 0,
      block: block ?? "",
      number: number ?? "",
      floor: floor ?? "",
      area: area ?? "",
      price: price ?? "",
      homeType: homeType ?? "",
      saleState: saleState ?? HOME_STATE.ON_SALE,
      roomSize: roomSize ?? "1",
      imageGalleries: imageGalleries != null
          ? imageGalleries!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()],
      videoGalleries: videoGalleries != null
          ? videoGalleries!.map((e) => e.toEntity()).toList()
          : [GalleryMediaDto().toEntity()]);
}
