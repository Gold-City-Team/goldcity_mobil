import 'package:goldcity/data/dto/receive/auth/token_model.dart';

final class AuthenticationSource {
  AccessTokenModel? _accessTokenModel;

  AccessTokenModel? getAccessToken() => _accessTokenModel;

  setAccessToken(AccessTokenModel value) {
    _accessTokenModel = value;
  }

  String resetPasswordToken = "";

  clearAccessToken() => _accessTokenModel = null;

  bool isTokenStillValid() {
    if (_accessTokenModel != null) {
      if (_accessTokenModel!.expires!
          .toLocal()
          .add(const Duration(minutes: -2))
          .isAfter(DateTime.now())) {
        return true;
      }
      return false;
    }
    return false;
  }
}
