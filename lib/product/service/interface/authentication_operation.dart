import 'package:gen/gen.dart';

/// An abstract class that defines the operations related to authentication.
abstract class AuthenticationOperation {
  /// Retrieves a list of users.
  Future<List<User>> users();

  /// Logs in a user with the provided credentials and firebase token.
  ///
  /// Returns a [ProductUser] object representing the logged-in user.
  Future<ProductUser> login(
    String username,
    String password,
    String firebaseToken,
  );

  /// Signs up a new user with the provided credentials and agreement.
  ///
  /// Returns a [Map] containing the response from the server.
  Future<EmptyNetworkModel> signUp(
    String username,
    String password,
    String email,
    String passwordConfirmation,
    int agreement,
  );
}
