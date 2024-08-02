// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorModel _$BaseErrorModelFromJson(Map<String, dynamic> json) =>
    BaseErrorModel(
      type: json['type'] as String?,
      title: json['title'] as String? ?? "Bilinmeyen bir hata oluştu",
      detail: json['detail'] as String? ?? "Bilinmeyen bir hata oluştu",
      status: (json['status'] as num?)?.toInt(),
      traceId: json['traceId'] as String?,
    )..errors = (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      );

Map<String, dynamic> _$BaseErrorModelToJson(BaseErrorModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'detail': instance.detail,
      'status': instance.status,
      'traceId': instance.traceId,
      'errors': instance.errors,
    };
