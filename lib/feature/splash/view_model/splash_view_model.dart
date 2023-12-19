import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movitty/feature/splash/view_model/mixin/splash_view_model_mixin.dart';
import 'package:movitty/feature/splash/view_model/state/splash_state.dart';
import 'package:movitty/product/state/base/base_cubit.dart';

/// The view model for the splash screen.
/// Handles the loading state and initialization logic.
class SplashViewModel extends BaseCubit<SplashState> with SplashViewModelMixin {
  /// Constructs a [SplashViewModel] with the required dependencies.
  SplashViewModel() : super(const SplashState(isLoading: true));

  //TODO: Edit this method to initialize the splash screen. Add service ops.

  /// Initializes the splash screen.
  /// Delays the execution for 2 seconds.
  Future<void> testInit(BuildContext context) async {
    log('[testInit]');

    await Future.delayed(const Duration(seconds: 2));
    try {
      navigateToApp(context: context, userStatus: userAuthStatus);
    } catch (e) {
      log('[testInit] error: $e');
    }
  }
}
