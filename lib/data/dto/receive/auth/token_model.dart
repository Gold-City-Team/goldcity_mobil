// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'token_model.g.dart';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

@JsonSerializable()
class TokenModel {
  @JsonKey(name: "accessToken")
  AccessTokenModel? accessTokenModel;
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  TokenModel({
    this.accessTokenModel,
    this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}

@JsonSerializable()
class AccessTokenModel {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "expires")
  DateTime? expires;

  AccessTokenModel({
    this.token,
    this.expires,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) => _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}
