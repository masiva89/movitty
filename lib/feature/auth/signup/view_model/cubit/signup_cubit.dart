import 'package:movitty/feature/auth/signup/view_model/state/signup_state.dart';
import 'package:movitty/product/state/index.dart';

/// A cubit that handles the signup functionality.
///
/// This cubit extends the [BaseCubit] class and provides the [onPressedSignup]
/// method to initiate the signup process.
abstract class SignupCubit extends BaseCubit<SignupState> {
  /// Creates a new instance of the SignupCubit class with the provided initial
  /// state.
  ///
  /// The [initialState] parameter is used to set the initial state of the
  /// SignupCubit.
  ///
  /// Example usage:
  /// ```dart
  /// SignupCubit(super.initialState);
  /// ```
  SignupCubit(super.initialState);

  /// Represents the signup cubit.
  /// This cubit is responsible for handling the signup process.
  /// It provides a method [onPressedSignup] to initiate the signup.
  /// Returns a [Future] that indicates whether the signup was successful or not.
  Future<bool> onPressedSignup();
}
