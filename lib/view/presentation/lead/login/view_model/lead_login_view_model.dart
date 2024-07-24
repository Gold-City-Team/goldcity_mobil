// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_google_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'lead_login_view_model.g.dart';

class LeadLoginViewModel = _LeadLoginViewModelBase with _$LeadLoginViewModel;

abstract class _LeadLoginViewModelBase with Store, BaseViewModel {
  late LeadUseCase _leadUseCase;
  late GoogleSignIn _googleSignIn;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _leadUseCase = locator<LeadUseCase>();
    _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: ['email'],
    );
  }

  String mailAdress = "zaferkurumsal@gmail.com";
  String password = "10568332323";

  Future<void> login() async {
    var result = await _leadUseCase
        .leadLogin(SendLeadLoginDto(email: mailAdress, password: password));
    if (result != null) {}
    // navigation.pop();
  }

  Future<void> handleSignIn() async {
    try {
      var result = await _googleSignIn.signInSilently();
      if (result != null) {
        await _leadUseCase.leadLoginGoogle(SendLeadLoginGoogleDto(
            googleToken: "${(await result.authentication).idToken}"));
      }
    } catch (error) {
      debugPrint("error $error");
    }
  }

  Future<void> handleSignInApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    debugPrint("test $credential");
  }
}
