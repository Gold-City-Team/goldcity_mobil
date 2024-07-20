import 'package:goldcity/domain/entity/media/media_entity.dart';

class ProjectTemplateNineEntity {
  int id;

  List<ProjectTemplateNineCampaignsEntity> campaigns;

  ProjectTemplateNineEntity({required this.id, required this.campaigns});
}

class ProjectTemplateNineCampaignsEntity {
  int id;
  String title;
  String description;
  MediaEntity mainImage;
  ProjectTemplateNineCampaignsEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.mainImage});
}
