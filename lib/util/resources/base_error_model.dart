import 'package:json_annotation/json_annotation.dart';

part 'base_error_model.g.dart';

@JsonSerializable()
class BaseErrorModel {
  String? type;
  String? title;
  String? detail;
  int? status;
  String? traceId;
  Map<String, List<String>>? errors;

  BaseErrorModel(
      {this.type,
      this.title = "Bilinmeyen bir hata oluştu",
      this.detail = "Bilinmeyen bir hata oluştu",
      this.status,
      this.traceId});

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) => _$BaseErrorModelFromJson(json);

  Map<String, dynamic>? toJson() => _$BaseErrorModelToJson(this);
}
