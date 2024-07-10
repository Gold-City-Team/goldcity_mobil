import 'package:goldcity/domain/entity/education/webinar_detail/education_detail_entity.dart';

class UserWebinarEntity {
  int id;
  WebinarDetailEntity educationDetail;
  String joinUrl;

  UserWebinarEntity(
      {required this.id, required this.educationDetail, required this.joinUrl});
}
