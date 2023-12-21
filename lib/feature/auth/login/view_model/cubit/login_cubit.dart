import 'package:flutter/material.dart';
import 'package:movitty/feature/auth/login/view_model/state/login_state.dart';
import 'package:movitty/product/state/base/base_cubit.dart';

/// This is the `LoginCubit` class.
/// It is an abstract class that extends `BaseCubit<LoginState>`.
/// This class represents the cubit for the login feature in the application.
/// It provides the functionality to handle login actions and state management.
abstract class LoginCubit extends BaseCubit<LoginState> {
  /// Creates a new instance of the `LoginCubit` class with the provided
  /// initial state. The `initialState` parameter is used to set the initial
  /// state of the `LoginCubit`.
  LoginCubit(super.initialState);

  /// This method is called when the login button is pressed.
  /// It performs the login action and returns a `Future<bool>` indicating the
  /// success of the login operation.
  Future<bool> onPressedLogin();

  /// Handles the logic for when the "Go Without Login" button is pressed.
  /// This method is responsible for performing the necessary actions when the
  /// user chooses to proceed without logging in.
  /// It returns a Future that completes when the actions are completed.
  Future<void> onPressedGoWithoutLogin(BuildContext context);
}
