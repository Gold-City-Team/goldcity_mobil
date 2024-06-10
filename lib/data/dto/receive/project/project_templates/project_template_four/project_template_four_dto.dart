import 'package:goldcity/data/dto/receive/features/features_dto.dart';
import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_four/project_template_four_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_template_four_dto.g.dart';

@JsonSerializable()
class ProjectTemplateFourDto {
  int? id;
  String? title;
  MediaDto? mediaItem;
  List<FeaturesDto>? features;
  List<GalleryMediaDto>? galleries;

  ProjectTemplateFourDto(
      {this.id, this.title, this.mediaItem, this.galleries, this.features});

  factory ProjectTemplateFourDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateFourDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateFourDtoToJson(this);
  ProjectTemplateFourEntity toEntity() => ProjectTemplateFourEntity(
        id: id ?? 0,
        title: title ?? "",
        features: features != null
            ? features!.map((e) => e.toEntity()).toList()
            : [FeaturesDto().toEntity()],
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        gallery: galleries != null
            ? galleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
      );
}
