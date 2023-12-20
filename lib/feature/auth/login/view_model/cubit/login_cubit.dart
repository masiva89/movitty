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
}
