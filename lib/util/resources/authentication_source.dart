import 'dart:convert';

import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/data/dto/receive/auth/user_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';

final class AuthenticationSource {
  UserDto? _userDto;

  UserDto? getUserDto() => _userDto;

  initUserDto() {
    var rawData =
        locator<SharedManager>().getStringValue(PreferenceKey.USER_DTO);
    if (rawData.isNotEmpty) {
      var data = UserDto.fromJson(jsonDecode(rawData));

      _userDto = data;
    }
  }

  setUserDto(UserDto value) {
    _userDto = value;
  }

  clearUserDto() => _userDto = null;

  bool isUserStillValid() {
    return _userDto != null;
  }
}
