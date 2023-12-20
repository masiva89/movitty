import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
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
    try {
      final response = await _authenticationOperationService.login(
        username: usernameController.text,
        password: passwordController.text,
        firebaseToken: 'firebaseToken',
      );
      log('response: ${response.toJson()}');
    } on Exception catch (e) {
      CustomLogger.showError(e);
    }
    /* await Future.delayed(const Duration(seconds: 2)).then((value) {
      ProjectSnackbar(
        title: 'title',
        message: 'lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
        type: ProjectSnackbarType.success,
      ).show();
    });
    final productUser = ProductUser(
      userId: '1',
      token: 'asdasd',
      refreshToken: 'asdasd',
    );
    final authCacheModel = AuthCacheModel(productUser: productUser);
    _authCacheOperation.add(authCacheModel); */
    changeLoading();
    print('login');
    return false;
  }

  /// Clear cache event to use in Login Feature
  void clearCache() {
    _authCacheOperation.clear();
  }
}
