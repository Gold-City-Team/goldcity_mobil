// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/language/language_manager.dart';
import 'package:goldcity/data/dto/receive/auth/user_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/authentication_source.dart';

class AuthenticationInterceptor implements Interceptor {
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6Iis5MDU1MjIyMDMyMTQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBRE1JTiIsImV4cCI6MTkxMjA0NDExMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NTAwMSIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjUwMDEifQ.FEPg6ddA3gdXO4ktDV5vR6ECQKkY1PGfaOoo4hmYuoQ",
      "Accept-Language": LanguageManager.instance.getLanguage(),
      "userType":
          locator<AuthenticationSource>().getUserDto()?.userType ?? "GUEST",
      "userId": locator<AuthenticationSource>().getUserDto()?.id ?? 0,
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.realUri.path.startsWith("/auth")) {
      if (response.realUri.path == SourcePath.LEAD_LOGIN.rawValue()) {
        var result = UserDto.fromJson(response.data);
        locator<AuthenticationSource>().setUserDto(result);
        locator<SharedManager>()
            .setStringValue(PreferenceKey.USER_DTO, jsonEncode(result));
      }
    }
    handler.next(response);
  }
}
