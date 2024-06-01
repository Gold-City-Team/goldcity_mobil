import 'package:json_annotation/json_annotation.dart';

part 'template_five_dto.g.dart';

@JsonSerializable()
class TemplateFiveDto {
  int? id;
  String? title;
}

@JsonSerializable()
class TemplateFiveMediaDto {
  int? id;
  String? title;
}
