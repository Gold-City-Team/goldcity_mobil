import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';

class UserEducationEntity {
  int id;
  EducationDetailEntity educationDetail;
  String joinUrl;

  UserEducationEntity(
      {required this.id, required this.educationDetail, required this.joinUrl});
}
