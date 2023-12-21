import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/splash/view_model/cubit/splash_cubit.dart';
import 'package:movitty/feature/splash/view_model/mixin/splash_view_model_mixin.dart';
import 'package:movitty/feature/splash/view_model/state/splash_state.dart';
import 'package:movitty/product/service/interface/splash_operation.dart';

/// The view model for the splash screen.
/// Handles the loading state and initialization logic.
class SplashViewModel extends SplashCubit with SplashViewModelMixin {
  /// Constructs a [SplashViewModel] with the required dependencies.
  SplashViewModel({
    required SplashOperation splashOperation,
  })  : _splashOperation = splashOperation,
        super(const SplashState(isLoading: true));

  final SplashOperation _splashOperation;

  //TODO: Edit this method to initialize the splash screen. Add service ops.

  /// Initializes the splash screen.
  /// Delays the execution for 2 seconds.
  @override
  Future<void> init(BuildContext context) async {
    log('[SplashViewModel] ------------------ START');
    log('[SplashViewModel] init');

    final isValidVersion = await checkVersion();
    if (isValidVersion == false) return;
    try {
      navigateToApp(context: context, userStatus: userAuthStatus);
    } catch (e) {
      log('[testInit] error: $e');
    }

    log('[SplashViewModel] ------------------ END');
  }

  /// Checks the version of the app.
  /// Returns a [Future] that completes with a [bool] value indicating whether
  /// the version is valid or not.
  /// If an exception occurs during the version check, it logs the error and
  /// returns false.
  Future<bool> checkVersion() async {
    AppVersion response;
    try {
      response = await _splashOperation.getVersion();
    } on Exception catch (e) {
      CustomLogger.showError<Exception>(e);
      return false;
    }
    return isValidVersion(response.version ?? '0.0.0');
  }
}
