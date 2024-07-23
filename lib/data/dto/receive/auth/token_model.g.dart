// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      accessTokenModel: json['accessToken'] == null
          ? null
          : AccessTokenModel.fromJson(
              json['accessToken'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessTokenModel,
      'refreshToken': instance.refreshToken,
    };

AccessTokenModel _$AccessTokenModelFromJson(Map<String, dynamic> json) =>
    AccessTokenModel(
      token: json['token'] as String?,
      expires: json['expires'] == null
          ? null
          : DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$AccessTokenModelToJson(AccessTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires?.toIso8601String(),
    };
