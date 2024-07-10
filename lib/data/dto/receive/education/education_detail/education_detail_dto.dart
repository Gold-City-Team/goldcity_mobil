import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'education_detail_dto.g.dart';

@JsonSerializable()
class EducationDetailDto {
  int? id;
  String? title;
  String? description;
  MediaDto? mainImage;
  List<GalleryMediaDto>? educationGalleries;
  EducationDetailDto(
      {this.id,
      this.title,
      this.description,
      this.mainImage,
      this.educationGalleries});
  factory EducationDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EducationDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EducationDetailDtoToJson(this);

  EducationDetailEntity toEntity() => EducationDetailEntity(
        id: id ?? 0,
        title: title ?? "",
        description: description ?? "",
        mainImage:
            mainImage != null ? mainImage!.toEntity() : MediaDto().toEntity(),
        educationGalleries: educationGalleries != null
            ? educationGalleries!.map((e) => e.toEntity()).toList()
            : [GalleryMediaDto().toEntity()],
      );
}
