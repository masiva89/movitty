import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/auth/login/view/login_view.dart';
import 'package:movitty/feature/auth/login/view_model/cubit/login_cubit.dart';
import 'package:movitty/feature/auth/login/view_model/state/login_state.dart';
import 'package:movitty/product/cache/model/auth_cache_model.dart';
import 'package:movitty/product/service/interface/authentication_operation.dart';

/// Manage your login view business logic
final class LoginViewModel extends LoginCubit {
  /// [AuthenticationOperation] service
  LoginViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<AuthCacheModel> authCacheOperation,
  })  : _authenticationOperationService = operationService,
        _authCacheOperation = authCacheOperation,
        super(const LoginState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<AuthCacheModel> _authCacheOperation;

  /// Username controller to use in [TextField] in [LoginView]
  TextEditingController usernameController = TextEditingController();

  /// Password controller to use in [TextField] in [LoginView]
  TextEditingController passwordController = TextEditingController();

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Login event to use in [LoginView]
  @override
  Future<bool> onPressedLogin() async {
    changeLoading();
    ProductUser productUser;
    try {
      productUser = await _authenticationOperationService.login(
        username: usernameController.text,
        password: passwordController.text,
        firebaseToken: 'firebaseToken',
      );
    } catch (e) {
      CustomLogger.showError<Exception>(e);
      changeLoading();
      return false;
    }
    final authCacheModel = AuthCacheModel(productUser: productUser);
    _authCacheOperation.add(authCacheModel);
    changeLoading();
    return true;
  }

  /// Clear cache event to use in Login Feature
  void clearCache() {
    _authCacheOperation.clear();
  }
}
