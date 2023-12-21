import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movitty/feature/splash/view_model/state/splash_state.dart';
import 'package:movitty/product/cache/index.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/navigation/guard/enum/user_status.dart';
import 'package:movitty/product/state/index.dart';

/// A mixin that provides common functionality for the SplashViewModel.
/// It is used in conjunction with the BaseCubit<SplashState> class.
mixin SplashViewModelMixin on BaseCubit<SplashState> {
  ProductCache get _productCache => ProductStateItems.productCache;

  /// [userAuthStatus] is a getter for user auth status.
  ///
  /// It returns [UserStatus] enum to use in guards.
  UserStatus get userAuthStatus {
    log('[userAuthStatus]');
    final authCacheModel =
        _productCache.authCacheOperation.get(CachePath.auth.value);
    if (authCacheModel == null) return UserStatus.notLoggedIn;
    log('[userAuthStatus] ${authCacheModel.userStatus}');
    return authCacheModel.userStatus;
  }

  /// [navigateToApp] is a method to navigate to app.
  void navigateToApp({
    required BuildContext context,
    required UserStatus userStatus,
  }) {
    log('[navigateToApp]');
    if (userAuthStatus == UserStatus.loggedIn) {
      log('[navigateToApp] userAuthStatus: $userAuthStatus');
      context.router.replace(const DashboardRoute());
    } else {
      log('[navigateToApp] userAuthStatus: $userAuthStatus');
      context.router.replace(const AuthNavRoute());
    }
  }

  /// Changes the loading state of the splash screen.
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
